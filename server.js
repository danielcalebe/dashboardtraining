const express = require('express');
const mysql = require('mysql2/promise');
const path = require('path');
const fs = require('fs');
const app = express();
const port = process.env.PORT || 25538;

// Configuração do banco de dados MySQL
const dbConfig = {
  connectionLimit: 10,
  connectTimeout: 60000, // Tempo limite de conexão aumentado para 60 segundos
  host: process.env.MYSQL_HOST || 'mysql-2221c92b-danielcalebe719-2b82.l.aivencloud.com',
  port: 25538, // Porta do serviço MySQL no Aiven
  user: process.env.MYSQL_USER || 'avnadmin',
  password: process.env.MYSQL_PASSWORD || '',
  database: process.env.MYSQL_DATABASE || 'defaultdb',

};

// Middleware para definir o Content-Type como application/json para a API
app.use((req, res, next) => {
  if (req.path.startsWith('/api/')) {
    res.setHeader('Content-Type', 'application/json');
  }
  next();
});

// Pool de conexões MySQL
const pool = mysql.createPool(dbConfig);

// Teste de conexão com o MySQL
async function testMySQLConnection() {
  try {
    const connection = await pool.getConnection();
    console.log('Conexão com o banco de dados MySQL estabelecida com sucesso!');
    connection.release();
  } catch (error) {
    console.error('Erro ao conectar ao banco de dados MySQL:', error);
  }
}

// Chama a função de teste de conexão antes de iniciar o servidor
testMySQLConnection();

// Rota de exemplo para consultar dados do banco de dados
app.get('/api/data', async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows, fields] = await connection.execute('SELECT * FROM sua_tabela');
    connection.release();
    res.json(rows);
  } catch (error) {
    console.error('Erro ao consultar o banco de dados:', error);
    res.status(500).json({ error: 'Erro ao consultar o banco de dados' });
  }
});

// Endpoint para obter dados dos departamentos
app.get('/api/departamentos', async (req, res) => {
  const dataInicial = new Date();
  dataInicial.setDate(dataInicial.getDate() - 30);
  const dataFormatada = dataInicial.toISOString().slice(0, 10);

  const query = `
    SELECT departamento, SUM(valor) AS gasto 
    FROM gastos 
    WHERE dataCadastro >= ? 
    GROUP BY departamento
  `;

  try {
    const connection = await pool.getConnection();
    const [results] = await connection.execute(query, [dataFormatada]);
    connection.release();
    res.json(results);
  } catch (error) {
    console.error('Erro ao executar consulta:', error);
    res.status(500).send('Erro ao obter dados');
  }
});

// Endpoint para obter dados de lucro mensal filtrados por ano
app.get('/api/lucro-mensal', async (req, res) => {
  const year = req.query.year || new Date().getFullYear();
  const query = `
    SELECT 
        DATE_FORMAT(dataPedido, '%Y-%m') AS mes,
        COALESCE(SUM(totalPedido), 0) AS total_pedido,
        COALESCE(SUM(total_gasto), 0) AS total_gasto,
        COALESCE(SUM(totalPedido) - SUM(total_gasto), 0) AS lucro
    FROM (
        SELECT 
            dataPedido,
            totalPedido,
            (SELECT COALESCE(SUM(valor), 0) 
             FROM gastos 
             WHERE YEAR(dataCadastro) = ? 
               AND MONTH(dataCadastro) = MONTH(pedidos.dataPedido)) AS total_gasto
        FROM 
            pedidos
        WHERE 
            YEAR(dataPedido) = ?
    ) AS pedidos_agrupados
    GROUP BY 
        mes
    ORDER BY 
        mes;
  `;

  try {
    const connection = await pool.getConnection();
    const [results] = await connection.execute(query, [year, year]);
    connection.release();
    res.json(results);
  } catch (error) {
    console.error('Erro ao executar consulta:', error);
    res.status(500).send('Erro ao obter dados');
  }
});

// Endpoint para obter dados de 'a_receber', 'a_pagar', 'vendas_mensais' e 'lucro_mensal'
// Endpoint para obter dados de 'a_receber', 'a_pagar', 'vendas_mensais' e 'lucro_mensal'
app.get('/api/dashboard-data', async (req, res) => {
  try {
    const connection = await pool.getConnection();

    // Total a Receber
    const totalReceberQuery = `
      SELECT COALESCE(SUM(totalPedido), 0) AS total_a_receber 
      FROM pedidos 
      WHERE status = 'em andamento';
    `;
    const [totalReceberRows] = await connection.execute(totalReceberQuery);

    // Total a Pagar
    const totalPagarQuery = `
      SELECT COALESCE(SUM(valor), 0) AS total_a_pagar 
      FROM gastos;
    `;
    const [totalPagarRows] = await connection.execute(totalPagarQuery);

    // Vendas Mensais
    const currentMonth = new Date().getMonth() + 1;
    const vendasMensaisQuery = `
      SELECT COALESCE(COUNT(*), 0) AS vendas_mensais 
      FROM pedidos 
      WHERE MONTH(dataPedido) = ? AND YEAR(dataPedido) = ?;
    `;
    const [vendasMensaisRows] = await connection.execute(vendasMensaisQuery, [currentMonth, new Date().getFullYear()]);

    // Lucro Mensal
    const lucroMensalQuery = `
      SELECT COALESCE(SUM(totalPedido), 0) AS lucro_mensal 
      FROM pedidos 
      WHERE MONTH(dataPedido) = ? AND YEAR(dataPedido) = ? AND status = 'concluído';
    `;
    const [lucroMensalRows] = await connection.execute(lucroMensalQuery, [currentMonth, new Date().getFullYear()]);

    connection.release();

    // Formatação e envio dos dados
    const total_a_receber = parseFloat(totalReceberRows[0].total_a_receber);
    const total_a_pagar = parseFloat(totalPagarRows[0].total_a_pagar);
    const vendas_mensais = parseInt(vendasMensaisRows[0].vendas_mensais);
    const lucro_mensal = parseFloat(lucroMensalRows[0].lucro_mensal);

    res.json({
      total_a_receber,
      total_a_pagar,
      vendas_mensais,
      lucro_mensal
    });
  } catch (error) {
    console.error('Erro ao obter dados do painel:', error);
    res.status(500).send('Erro ao obter dados do painel');
  }
});


// Endpoint para obter os 5 produtos mais vendidos
app.get('/api/top5-produtos', async (req, res) => {
  try {
    const query = `
      SELECT 
        pp.idProdutos AS idProduto, 
        pr.nome AS nomeProduto, 
        pr.tipo AS tipoProduto, 
        SUM(pp.quantidade) AS quantidade_vendas
      FROM pedidos_produtos pp
      INNER JOIN produtos pr ON pp.idProdutos = pr.id
      INNER JOIN pedidos p ON pp.idPedidos = p.id
      WHERE p.dataPedido >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
      GROUP BY pp.idProdutos
      ORDER BY quantidade_vendas DESC
      LIMIT 5
    `;

    const connection = await pool.getConnection();
    const [results] = await connection.execute(query);
    connection.release();
    res.json(results);
  } catch (error) {
    console.error('Erro ao obter os top 5 produtos:', error);
    res.status(500).send('Erro ao obter os top 5 produtos');
  }
});

// Servir arquivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Iniciar o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
