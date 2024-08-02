-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Ago-2024 às 22:14
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdtcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `permissoes` int(10) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `nome`, `last_login`, `permissoes`) VALUES
(1, 'super@super', NULL, 'super@super', NULL, 1),
(2, 'user@user', NULL, 'user@user', NULL, 1),
(3, 'se@se', '$2y$12$7V/iAPBTrEhDkjPrXY0mbOK5Iti7rEPiwLiXmPvbmpGv6ihP5MXqa', 'Admin', '2024-07-24 10:04:58', 1),
(5, 'nome@gmail', '$2y$12$IK41wqJTIbEkKsrYXwoV0Oh3C89pGxs0NI3T/bs6fzFpgwPNT1UXq', 'Nome', '2024-07-19 00:00:00', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `admpermissoes`
--

CREATE TABLE `admpermissoes` (
  `id` int(2) NOT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `permissoes` text DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL,
  `idFuncionario` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(10) NOT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFim` time DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `idPedidos`, `dataInicio`, `dataFim`, `horaInicio`, `horaFim`, `observacao`, `dataCadastro`, `dataAtualizacao`) VALUES
(1, 3, '2024-07-05', '2024-07-05', '21:55:00', '00:00:00', 'Oioioi', NULL, '2024-07-23'),
(2, 4, '2024-07-05', '2024-07-05', '21:55:00', '02:06:00', 'Oioioi', NULL, NULL),
(3, 25, '2024-07-05', '2024-07-05', '21:55:00', '02:06:00', 'Oioioi', NULL, NULL),
(4, 33, '2024-07-05', '2024-07-05', '21:55:00', '02:06:00', 'Oioioi', NULL, NULL),
(9, 13, '2024-07-24', '2024-07-25', '17:00:00', '00:00:00', 'Deve terminar um pouco antes.', '2024-07-06', '2024-07-06'),
(16, 101, '2024-07-25', '2024-07-25', '13:00:00', '17:00:00', 'Quero...', '2024-07-24', NULL),
(17, 102, '2024-07-25', '2024-07-25', '13:05:00', '17:00:00', 'Festa entre amigos...', '2024-07-24', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT 'ativo',
  `email` varchar(255) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `dataCadastro` date DEFAULT current_timestamp(),
  `dataAtualizacao` date DEFAULT current_timestamp(),
  `dataRemocao` date DEFAULT NULL,
  `caminhoImagem` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `last_login` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `dataNascimento`, `status`, `email`, `password`, `dataCadastro`, `dataAtualizacao`, `dataRemocao`, `caminhoImagem`, `telefone`, `last_login`) VALUES
(1, 'João Bruno', '45723890123', '2004-07-22', 'ativo', 'joao@gmail.com', '$2y$12$SyPZDZqrXf35DgI2TkbKZOmk/JZUbeu2b5XVEQmu2w13T7zXwG1B6', '2024-07-03', '2024-07-23', NULL, 'Joao.jpg', '(31) 92345-6789', NULL),
(27, 'Daniel Calebe', '89132456780', '2007-09-30', 'ativo', 'daniel@gmail.com', '$2y$10$59LZOS7n2YzjmkfSje7UWOx/4z/qAoM0fPGBhaUv4x18WqQDxQfj2', '2024-06-19', '2024-06-19', NULL, 'Daniel.jpg', '3193456789', NULL),
(52, 'Pedro Paiva', '65389207451', '2001-05-12', 'ativo', 'pedro@gmail.com', '$2y$12$wbCgQgUfY9tdIsWUl/zOTeAf7aFdnH6F/Mrj9DlPpr9ZAaTDGoyRy', '2024-07-04', '2024-07-04', NULL, 'Pedro.jpg', '3198765432', '2024-07-19'),
(58, 'Bruna Santos', '29045731689', '2001-01-01', 'ativo', 'bruna@gmail.com', NULL, '2024-07-06', '2024-07-06', NULL, 'Bruna.jpg', '3192837465', NULL),
(59, 'Renata Vasconcelhos', '12356908745', '2004-07-06', 'ativo', 'renata@gmail.com', '$2y$12$BWiiOuxDbRs/x1BnOAL53uCGss1.aF7dANn4LuNCY8XQ62dhRHzey', '2024-07-06', '2024-07-06', NULL, 'Renata.jpg', '3192345876', NULL),
(68, 'Person', '15332177799', '2001-01-01', 'ativo', 'people1@gmail.com', '$2y$12$bBE9NVv4BlviaqZb.2ZjA.exD3XL6G6UODw00j2En7fxqUWS0H1hS', '2024-07-24', '2024-07-24', NULL, '1721825628_transferir.jpeg', '31997766372', '2024-07-24');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos_clientes`
--

CREATE TABLE `enderecos_clientes` (
  `id` int(10) NOT NULL,
  `tipo` enum('residencial','comercial') DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `idClientes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `enderecos_clientes`
--

INSERT INTO `enderecos_clientes` (`id`, `tipo`, `cep`, `cidade`, `bairro`, `rua`, `numero`, `complemento`, `idClientes`) VALUES
(4, 'residencial', 31655470, 'Belo Horizonte', 'Mantiqueira', 'Rua Edith Gomes Martins', 96, 'dsda', NULL),
(5, 'residencial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 903, '302', 27),
(6, 'residencial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 34, '12', 27),
(7, 'residencial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 1, '1', 1),
(9, 'residencial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 1, '2', NULL),
(10, 'comercial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 23, '3', NULL),
(11, 'comercial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 546546, '5645654', 1),
(12, 'residencial', 44433322, 'asas', 'sas', 'ss', 11, 'ss', 58),
(13, 'residencial', 31655470, 'Belo Horizonte', 'Mantiqueira', 'Rua Edith Gomes Martinsssss', 1122222, '22', 58),
(14, 'residencial', 31655444, 'plus', 'plus', 'plus', 11, 'plus', 58),
(15, 'comercial', 31655470, 'Belo Horizonte', 'Mantiqueira', 'Rua Edith Gomes Martins', 99, 'pp', 52),
(16, 'residencial', 31655470, 'Belo Horizonte', 'Mantiqueira', 'Rua Edith Gomes Martins', 6262, 'Aqui', 59),
(23, 'residencial', 31530250, 'Belo Horizonte', 'Santa Mônica', 'Rua dos Comanches', 12, '12', 1),
(24, 'comercial', 30160040, 'Belo Horizonte', 'Centro', 'Rua Rio de Janeiro', 471, NULL, 68);

-- --------------------------------------------------------

--
-- Estrutura da tabela `esqueci_senha`
--

CREATE TABLE `esqueci_senha` (
  `id` int(10) NOT NULL,
  `idClientes` int(10) DEFAULT NULL,
  `token` int(10) DEFAULT NULL,
  `dataEmissao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(10) NOT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `avaliacao` enum('1','2','3','4','5') DEFAULT NULL,
  `dataMensagem` date DEFAULT NULL,
  `idPedidos` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `mensagem`, `avaliacao`, `dataMensagem`, `idPedidos`) VALUES
(1, 'Muito Bom! Atendimento ótimo, e funcionários super simpáticos! Super recomendo!', '5', '2024-07-15', 3),
(2, 'Muito Ruim!', '2', '2024-07-15', 4),
(3, 'Muito bom, amei!', '2', '2024-07-19', NULL),
(4, 'Posse', '5', '2024-07-19', NULL),
(5, 'Foi bom, mas esperava um pouco mais!', '3', '2024-07-24', 101);

-- --------------------------------------------------------

--
-- Estrutura da tabela `formas_pagamento`
--

CREATE TABLE `formas_pagamento` (
  `id` int(10) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `classe` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(10) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `telefone1` int(11) DEFAULT NULL,
  `telefone2` int(11) DEFAULT NULL,
  `telefone3` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cep` int(8) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `status` enum('ativo','inativo') DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL,
  `cnpj` int(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `telefone1`, `telefone2`, `telefone3`, `email`, `cep`, `estado`, `cidade`, `rua`, `numero`, `complemento`, `status`, `dataCadastro`, `dataAtualizacao`, `dataRemocao`, `cnpj`) VALUES
(1, 'Fornecedor de refrigerante', 2147483647, 312312, 32131, 'ovo@ovo', 31530250, 'asdsa', 'dsad', 'asdasd', 2, '12', 'ativo', '2024-07-06', '2024-07-06', NULL, 2147483647),
(3, 'Fornecedor de Matérias Primas', 2147483647, 212313, 23123123, 'materiasprimas@gmail.com', 31530250, 'aa', 'aa', 'aa', 12, 'aa', 'ativo', '2024-07-23', '2024-07-23', NULL, 2147483647);

-- --------------------------------------------------------

--
-- Estrutura da tabela `galeria_imagens`
--

CREATE TABLE `galeria_imagens` (
  `id` int(10) NOT NULL,
  `evento` enum('outros','casamento','15anos','formatura','infantil') DEFAULT 'outros',
  `descricao` varchar(255) NOT NULL,
  `nomeImagem` varchar(25) NOT NULL,
  `tamanhoImagem` varchar(25) DEFAULT NULL,
  `tipoImagem` varchar(25) DEFAULT NULL,
  `caminhoImagem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Extraindo dados da tabela `galeria_imagens`
--

INSERT INTO `galeria_imagens` (`id`, `evento`, `descricao`, `nomeImagem`, `tamanhoImagem`, `tipoImagem`, `caminhoImagem`) VALUES
(23, 'casamento', 'Casamento', 'casamento', NULL, NULL, 'casamento.jpg'),
(24, 'formatura', 'Formatura', 'formatura', NULL, NULL, 'formatura.jpg'),
(25, '15anos', 'Festa de 15 anos', '15anos', NULL, NULL, '15anos.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gastos`
--

CREATE TABLE `gastos` (
  `id` int(10) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `status` int(10) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `gastos`
--

INSERT INTO `gastos` (`id`, `motivo`, `valor`, `dataCadastro`, `dataAtualizacao`, `departamento`, `status`) VALUES
(1, 'Conta de luz', 100.00, '2024-07-17', '2024-07-18', 'RH', 2),
(2, 'Freelancers', 500.00, '2024-07-17', '2024-07-23', 'RH', 2),
(4, 'Conta de água', 320.00, '2024-07-18', '2024-07-18', 'RH', 1),
(5, 'Salário', 5000.00, '2024-07-18', '2024-07-23', 'RH', 2),
(7, 'Compra de materiais de confeitaria', 1200.00, '2024-07-19', '2024-07-23', 'Compras', 1),
(8, 'Compra de matéria prima', 1500.00, '2015-02-02', '2024-07-23', 'Compras', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias_primas_estoque`
--

CREATE TABLE `materias_primas_estoque` (
  `id` int(10) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `classificacao` enum('perecivel','nao perecivel') DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL,
  `caminhoImagem` varchar(200) DEFAULT NULL,
  `idFornecedores` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `materias_primas_estoque`
--

INSERT INTO `materias_primas_estoque` (`id`, `nome`, `classificacao`, `quantidade`, `precoUnitario`, `dataCadastro`, `dataAtualizacao`, `dataRemocao`, `caminhoImagem`, `idFornecedores`) VALUES
(2, 'Ovo', 'nao perecivel', 50, 1.00, '2024-07-06', '2024-07-07', NULL, 'ovo.jpg', 3),
(3, 'Coca cola', 'perecivel', 2, 21.00, '2024-07-06', '2024-07-07', NULL, 'agua.jpg', 1),
(6, 'Farinha', 'nao perecivel', 1, 5.00, '2024-07-07', '2024-07-07', NULL, 'farinha.jpg', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  `dataEnvio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `nome`, `email`, `assunto`, `mensagem`, `dataEnvio`) VALUES
(1, 'Renato', 'renato@gmail.com', 'Festa de casamento', 'Gostaria de saber se fazem buffet para festa de casamento?', '2024-07-23'),
(2, 'Bruna', 'bruna@gmail.com', 'Entregas', 'Gostaria saber se entregam no endereço xxxxxx', '2024-07-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_01_185808_add_timestamps_to_clientes_table', 2),
(6, '2024_07_02_162518_add_timestamps_to_clientes_table', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes_materias_primas`
--

CREATE TABLE `movimentacoes_materias_primas` (
  `id` int(10) NOT NULL,
  `idMateriaPrima` int(10) DEFAULT NULL,
  `tipo` enum('entrada','saida','retorno') DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimentacoes_produtos`
--

CREATE TABLE `movimentacoes_produtos` (
  `id` int(10) NOT NULL,
  `tipo` enum('entrada','saida','retorno') DEFAULT NULL,
  `idProdutos` int(10) DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes`
--

CREATE TABLE `notificacoes` (
  `id` int(10) NOT NULL,
  `idNotificacaoArray` int(10) DEFAULT NULL,
  `mensagem` varchar(500) DEFAULT NULL,
  `dataEnvio` date DEFAULT NULL,
  `titulo` varchar(255) NOT NULL,
  `lido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notificacoes`
--

INSERT INTO `notificacoes` (`id`, `idNotificacaoArray`, `mensagem`, `dataEnvio`, `titulo`, `lido`) VALUES
(1, 1, 'Oi, o seu pedido deve ser pago até o dia 1...', '2024-06-08', 'PEDIDO', 0),
(2, 2, 'Oi, o seu pedido deve ser pago até o dia...dkjsdhsahdlsadhadsadsad', '2024-06-08', 'PEDIDO', 0),
(6, 0, 'o fafa é fota', '2024-06-10', 'fafa viado', 0),
(8, NULL, 'Olá Novo pedido criado: #fique atento as notificações \n                    e acompanhe seu pedido!', '2024-07-16', 'Novo pedido', 0),
(10, NULL, 'Olá pedrin Novo pedido criado: #PEpUBzxk21fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-16', 'Novo pedido', 0),
(11, NULL, 'Olá pedrin! Novo pedido criado: <a href=\"http://localhost:8086/pedidos/pedidosDetalhes/PEeL8DYW71\">Ver detalhes do pedido #PEeL8DYW71</a> Fique atento às notificações e acompanhe seu pedido!', '2024-07-16', 'Novo pedido', 0),
(12, NULL, 'Olá pedrin! Novo pedido criado: #PEp4ESuz95fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-16', 'Novo pedido', 0),
(13, NULL, 'Olá pedrin! Novo pedido criado: #PEwqbP6N28fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-16', 'Novo pedido', 0),
(14, NULL, 'dafaf', '2024-07-18', 'Algo', 0),
(18, NULL, 'Um novo pedido foi feito: 88', '2024-07-19', 'Novo Pedido', 0),
(19, NULL, 'Um novo pedido foi feito: 89', '2024-07-19', 'Novo Pedido', 1),
(21, NULL, 'Um novo pedido foi feito: 90', '2024-07-19', 'Novo Pedido', 1),
(22, NULL, 'Olá pedrin! Novo pedido criado: #PEXYmHSb89 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 1),
(23, NULL, 'Um novo pedido foi feito: 91', '2024-07-19', 'Novo Pedido', 0),
(24, NULL, 'Olá pedrin! Novo pedido criado: #PEk2B6vw68 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(25, NULL, 'sei la cara', '2024-07-19', 'Ol', 0),
(26, NULL, 'Um novo pedido foi feito: 92', '2024-07-19', 'Novo Pedido', 0),
(27, NULL, 'Olá pedrin! Novo pedido criado: #PEzWWMKd19 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(28, NULL, 'Um novo pedido foi feito: 93', '2024-07-19', 'Novo Pedido', 0),
(29, NULL, 'Olá pedrin! Novo pedido criado: #PELMxhYd87 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(30, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-19', 'Pedido Aceito', 0),
(31, NULL, 'Seu pedido está em produção.', '2024-07-19', 'Em Produção', 0),
(32, NULL, 'Seu pedido foi produzido e está pronto para entrega.', '2024-07-19', 'Produzido', 0),
(33, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-19', 'Entregue', 0),
(34, NULL, 'Um novo pedido foi feito: 94', '2024-07-19', 'Novo Pedido', 0),
(35, NULL, 'Olá pedrin! Novo pedido criado: #PEOBCGu759 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(36, NULL, 'Um novo pedido foi feito: 95', '2024-07-19', 'Novo Pedido', 0),
(37, NULL, 'Olá pedrin! Novo pedido criado: #PEU83frT33 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(38, NULL, 'Um novo pedido foi feito: 96', '2024-07-19', 'Novo Pedido', 0),
(39, NULL, 'Seu pedido está em análise.', '2024-07-19', 'Em Análise', 0),
(40, NULL, 'Um novo pedido foi feito: 97', '2024-07-19', 'Novo Pedido', 0),
(41, NULL, 'Olá Dj! Novo pedido criado: #PEp4V9C679 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(42, NULL, 'Um novo pedido foi feito: 98', '2024-07-19', 'Novo Pedido', 0),
(43, NULL, 'Olá pedrin! Novo pedido criado: #PEprCjRW69 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(44, NULL, 'Um novo pedido foi feito: 99', '2024-07-19', 'Novo Pedido', 0),
(45, NULL, 'Olá Dj! Novo pedido criado: #PESZKlkv66 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(46, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-19', 'Pedido Aceito', 0),
(47, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-19', 'Entregue', 0),
(48, NULL, 'Um novo pedido foi feito: 100', '2024-07-19', 'Novo Pedido', 0),
(49, NULL, 'Olá Dj! Novo pedido criado: #PElg8pIP57 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-19', 'Novo pedido', 0),
(51, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-22', 'Pedido Aceito', 0),
(52, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-23', 'Entregue', 0),
(53, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-23', 'Entregue', 0),
(54, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-23', 'Pedido Aceito', 0),
(55, NULL, 'Seu pedido está em produção.', '2024-07-23', 'Em Produção', 0),
(56, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-23', 'Pedido Aceito', 0),
(57, NULL, 'Status desconhecido.', '2024-07-23', 'Status Desconhecido', 0),
(58, NULL, 'Seu pedido está em produção.', '2024-07-23', 'Em Produção', 0),
(59, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-23', 'Entregue', 0),
(60, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-23', 'Pedido Aceito', 0),
(61, NULL, 'Status desconhecido.', '2024-07-23', 'Status Desconhecido', 0),
(62, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-23', 'Pedido Aceito', 0),
(63, NULL, 'Status desconhecido.', '2024-07-23', 'Status Desconhecido', 0),
(64, NULL, 'Um novo pedido foi feito: 101', '2024-07-24', 'Novo Pedido', 0),
(65, NULL, 'Olá Person! Novo pedido criado: #PERGmhLB83 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-24', 'Novo pedido', 0),
(66, NULL, 'Seu pedido está em análise.', '2024-07-24', 'Em Análise', 0),
(67, NULL, 'Status desconhecido.', '2024-07-24', 'Status Desconhecido', 0),
(68, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-24', 'Pedido Aceito', 0),
(69, NULL, 'Um novo pedido foi feito: 102', '2024-07-24', 'Novo Pedido', 0),
(70, NULL, 'Olá Person! Novo pedido criado: #PEqeELrp16 fique atento as notificações \n                 e acompanhe seu pedido!', '2024-07-24', 'Novo pedido', 0),
(71, NULL, 'Seu pedido está em análise.', '2024-07-24', 'Em Análise', 0),
(72, NULL, 'Seu pedido foi entregue com sucesso.', '2024-07-24', 'Entregue', 0),
(73, NULL, 'Seu pedido foi aceito e está em preparação.', '2024-07-24', 'Pedido Aceito', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes_clientes`
--

CREATE TABLE `notificacoes_clientes` (
  `id` int(10) NOT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `idClientes` int(10) DEFAULT NULL,
  `idNotificacoes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notificacoes_clientes`
--

INSERT INTO `notificacoes_clientes` (`id`, `idPedidos`, `idClientes`, `idNotificacoes`) VALUES
(1, 3, 52, 1),
(9, 4, 52, NULL),
(11, NULL, 52, 10),
(12, NULL, 52, NULL),
(13, NULL, 52, NULL),
(14, NULL, 52, NULL),
(15, 3, 52, NULL),
(17, NULL, 52, NULL),
(18, NULL, 52, NULL),
(19, NULL, 52, NULL),
(20, NULL, 52, NULL),
(21, NULL, 52, NULL),
(22, NULL, 52, 30),
(23, NULL, 52, 31),
(24, NULL, 52, 32),
(25, NULL, 52, 33),
(26, NULL, 52, NULL),
(27, NULL, 52, NULL),
(30, NULL, 52, NULL),
(36, NULL, 52, 51),
(37, 3, 52, 52),
(38, 4, 52, 53),
(39, 33, 52, 54),
(40, 33, 52, 55),
(41, 13, 52, 56),
(42, 13, 52, 57),
(43, 3, 1, 58),
(44, 3, 1, 59),
(45, 13, 52, 60),
(46, 13, 52, 61),
(47, 13, 52, 62),
(48, 13, 52, 63),
(49, 101, 68, 65),
(50, 101, 68, 66),
(51, 101, 68, 67),
(52, 101, 68, 68),
(53, 102, 68, 70),
(54, 102, 68, 71),
(55, 101, 68, 72),
(56, 102, 68, 73);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacoes_colaboradores`
--

CREATE TABLE `notificacoes_colaboradores` (
  `id` int(11) NOT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `idAdmins` int(10) DEFAULT NULL,
  `idNotificacoes` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notificacoes_colaboradores`
--

INSERT INTO `notificacoes_colaboradores` (`id`, `idPedidos`, `idAdmins`, `idNotificacoes`) VALUES
(5, NULL, 1, 18),
(6, NULL, 1, 19),
(7, NULL, 1, 21),
(8, NULL, 1, 23),
(9, NULL, 1, 26),
(10, NULL, 1, 28),
(11, NULL, 1, 34),
(12, NULL, 1, 36),
(13, NULL, 1, 38),
(14, NULL, 1, 40),
(15, NULL, 1, 42),
(16, NULL, 1, 44),
(17, NULL, 1, 48),
(18, 101, 1, 64),
(19, 102, 1, 69);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) NOT NULL,
  `idClientes` int(10) DEFAULT NULL,
  `observacao` varchar(500) DEFAULT NULL,
  `status` int(10) DEFAULT 1,
  `totalPedido` decimal(10,2) DEFAULT NULL,
  `dataPedido` date DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `idServicos` int(10) NOT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `idEnderecos` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `idClientes`, `observacao`, `status`, `totalPedido`, `dataPedido`, `dataEntrega`, `idServicos`, `codigo`, `dataAtualizacao`, `idEnderecos`) VALUES
(3, 1, 'algo', 6, 5000.00, '2024-07-16', '2024-07-09', 36, 'YUjhkRoW58', '2024-07-23', 13),
(4, 27, 'algo', 6, 500.00, '2024-07-17', '2024-07-23', 37, 'ABcdEfGh12', '2024-07-23', 13),
(13, 52, 'Uma festinha entre amigos.', 1, 1250.00, '2024-07-19', '2024-07-13', 2, 'MnOpQrSt90', '2024-07-23', 13),
(25, 58, 'algu', 1, 400.00, '2024-07-17', '2024-07-29', 1, 'QWertyUi45', '2024-07-23', 13),
(33, 59, 'alllgo', 4, 300.00, '2024-07-07', '2024-07-31', 4, 'PEtylGaS36', '2024-07-23', 13),
(101, 68, 'Quero...', 6, 150.00, '2024-07-24', '2024-07-25', 53, 'PERGmhLB83', '2024-07-24', NULL),
(102, 68, 'Festa entre amigos...', 3, 10.50, '2024-07-24', '2024-07-25', 3, 'PEqeELrp16', '2024-07-24', 24);

--
-- Acionadores `pedidos`
--
DELIMITER $$
CREATE TRIGGER `after_pedido_insert` AFTER INSERT ON `pedidos` FOR EACH ROW BEGIN
    DECLARE newNotificacaoId INT;
    DECLARE adminId INT;
    
    -- Suponha que você tenha uma maneira de determinar qual admin deve receber a notificação
    -- Aqui, vamos apenas pegar o primeiro admin como exemplo
    SET adminId = (SELECT id FROM admins WHERE permissoes = '1' LIMIT 1);
    
    -- Insere a notificação na tabela notificacoes
    INSERT INTO notificacoes (titulo, mensagem, dataEnvio)
    VALUES ('Novo Pedido', CONCAT('Um novo pedido foi feito: ', NEW.id), NOW());
    
    -- Obtém o ID da notificação recém-inserida
    SET newNotificacaoId = LAST_INSERT_ID();
    
    -- Insere o relacionamento na tabela notificacoes_colaboradores

    INSERT INTO notificacoes_colaboradores (idPedidos, idAdmins, idNotificacoes)
    VALUES (NEW.id, adminId, newNotificacaoId);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_status_update` AFTER UPDATE ON `pedidos` FOR EACH ROW BEGIN
    DECLARE mensagem TEXT;
    DECLARE titulo VARCHAR(255);
    DECLARE cliente_id INT;
    DECLARE notificacao_id INT;

    -- Seleciona o idClientes associado ao pedido
    SELECT idClientes INTO cliente_id
    FROM pedidos
    WHERE id = NEW.id;

    -- Define a mensagem e o título com base no novo status
    CASE NEW.status
        WHEN '2' THEN
            SET mensagem = 'Seu pedido está em análise.';
            SET titulo = 'Em Análise';
        WHEN '3' THEN
            SET mensagem = 'Seu pedido foi aceito e está em preparação.';
            SET titulo = 'Pedido Aceito';
        WHEN '4' THEN
            SET mensagem = 'Seu pedido está em produção.';
            SET titulo = 'Em Produção';
        WHEN '5' THEN
            SET mensagem = 'Seu pedido foi produzido e está pronto para entrega.';
            SET titulo = 'Produzido';
        WHEN '6' THEN
            SET mensagem = 'Seu pedido foi entregue com sucesso.';
            SET titulo = 'Entregue';
        WHEN '7' THEN
            SET mensagem = 'Seu pedido foi recusado.';
            SET titulo = 'Recusado';
        WHEN '8' THEN
            SET mensagem = 'Seu pedido foi cancelado.';
            SET titulo = 'Cancelado';
        ELSE
            SET mensagem = 'Status desconhecido.';
            SET titulo = 'Status Desconhecido';
    END CASE;

    -- Verifica se o status foi alterado
    IF OLD.status <> NEW.status THEN
        -- Insere um novo registro na tabela de notificações com o pedido_id, cliente_id, mensagem e título apropriados
        INSERT INTO notificacoes (titulo, mensagem, dataEnvio, lido)
        VALUES (titulo, mensagem, NOW(), 0);

        -- Obtém o ID da notificação inserida
        SET notificacao_id = LAST_INSERT_ID();

        -- Insere o registro na tabela de notificacoes_clientes
        INSERT INTO notificacoes_clientes (idPedidos, idClientes, IdNotificacoes) 
        VALUES (NEW.id, cliente_id, notificacao_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_andamentos`
--

CREATE TABLE `pedidos_andamentos` (
  `id` int(10) NOT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `status` enum('pendente','aceito','cancelado','entregue') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

CREATE TABLE `pedidos_produtos` (
  `id` int(10) NOT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `idProdutos` int(10) DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`id`, `idPedidos`, `idProdutos`, `quantidade`, `subtotal`) VALUES
(9, 25, NULL, NULL, NULL),
(11, 33, NULL, NULL, NULL),
(13, 13, 1, 100, 200.00),
(14, 13, 2, 100, 200.00),
(15, 13, 3, 50, 50.00),
(16, 33, 3, 15, 29.85),
(17, 33, NULL, 2, 3.98),
(18, 33, NULL, 1, 1.99),
(19, 33, NULL, 1, 1.99),
(20, 33, 3, 1, 1.99),
(21, 33, NULL, 1, 1.99),
(22, 33, NULL, 1, 1.99),
(23, 33, 3, 1, 1.99),
(24, 33, NULL, 1, 1.99),
(25, 33, NULL, 1, 1.99),
(26, 33, 3, 1, 1.99),
(27, 33, NULL, 1, 1.99),
(28, 33, NULL, 1, 1.99),
(29, 33, 3, 1, 1.99),
(30, 33, NULL, 1, 1.99),
(31, NULL, NULL, 2, 3.98),
(32, NULL, NULL, 1, 1.99),
(34, NULL, NULL, 1, 15.00),
(35, NULL, NULL, 1, 15.00),
(36, NULL, NULL, 1, 15.00),
(37, NULL, NULL, 1, 15.00),
(38, NULL, 1, 1, 2.00),
(39, NULL, NULL, 1, 1.99),
(40, NULL, NULL, 1, 15.00),
(41, NULL, NULL, 1, 15.00),
(42, NULL, 1, 1, 2.00),
(43, NULL, NULL, 1, 1.99),
(44, NULL, NULL, 1, 15.00),
(45, NULL, NULL, 1, 15.00),
(46, NULL, 1, 1, 2.00),
(47, NULL, NULL, 1, 1.99),
(48, NULL, NULL, 1, 15.00),
(49, NULL, 1, 5, 10.00),
(50, NULL, NULL, 66, 990.00),
(51, NULL, NULL, 1, 15.00),
(52, NULL, NULL, 1, 15.00),
(55, 4, 1, 100, 200.00),
(56, 4, 2, 100, 200.00),
(58, 13, 23, 50, 150.00),
(59, 13, 22, 100, 150.00),
(60, 3, 1, 100, 200.00),
(61, NULL, NULL, 3, 5.97),
(62, NULL, NULL, 1, 1.99),
(63, NULL, NULL, 1, 15.00),
(64, NULL, NULL, 1, 15.00),
(65, NULL, 3, 2000, 2000.00),
(66, NULL, 1, 7, 14.00),
(67, NULL, NULL, 4, 60.00),
(68, NULL, NULL, 6, 72.00),
(69, NULL, NULL, 4, 88.00),
(73, 101, 1, 75, 150.00),
(75, 102, 1, 3, 6.00),
(76, 102, 22, 3, 4.50);

--
-- Acionadores `pedidos_produtos`
--
DELIMITER $$
CREATE TRIGGER `atualizar_total_pedido` AFTER INSERT ON `pedidos_produtos` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10,2);
    
    -- Calcula o total dos pedidos_produtos para o pedido atual
    SELECT SUM(subtotal) INTO total
    FROM pedidos_produtos
    WHERE idPedidos = NEW.idPedidos;
    
    -- Atualiza o totalPedido na tabela pedidos
    UPDATE pedidos
    SET totalPedido = totalPedido+total
    WHERE id = NEW.idPedidos;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_servicos`
--

CREATE TABLE `pedidos_servicos` (
  `id` int(10) NOT NULL,
  `idServicos` int(10) DEFAULT NULL,
  `idPedidos` int(10) DEFAULT NULL,
  `funcionarioTipo` varchar(255) DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedidos_servicos`
--

INSERT INTO `pedidos_servicos` (`id`, `idServicos`, `idPedidos`, `funcionarioTipo`, `quantidade`, `subtotal`) VALUES
(25, 1, 13, 'Garcom', 1, 150.00),
(26, 1, 13, 'Cozinheiro', 2, 300.00),
(27, 1, 13, 'Barman', 3, 450.00),
(28, 2, 3, 'Garcom', 2, 300.00),
(29, 2, 3, 'Cozinheiro', 3, 450.00),
(30, 2, 3, 'Barman', 4, 600.00),
(31, 3, 4, 'Garcom', 3, 450.00),
(32, 3, 4, 'Cozinheiro', 4, 600.00),
(33, 3, 4, 'Barman', 5, 750.00),
(34, 4, NULL, 'Garcom', 0, 0.00),
(35, 4, NULL, 'Cozinheiro', 0, 0.00),
(36, 4, NULL, 'Barman', 0, 0.00),
(37, 6, 33, 'Barman', 15, 2250.00),
(38, 6, NULL, 'Garcom', 15, 2250.00),
(39, 6, NULL, 'Cozinheiro', 15, 2250.00),
(40, 7, NULL, 'Barman', 22, 3300.00),
(41, 7, 33, 'Garcom', 22, 3300.00),
(42, 7, NULL, 'Cozinheiro', 22, 3300.00),
(43, 8, NULL, 'Barman', 22, 3300.00),
(44, 8, NULL, 'Garcom', 22, 3300.00),
(45, 8, NULL, 'Cozinheiro', 22, 3300.00),
(46, 9, 25, 'Barman', 2, 300.00),
(47, 9, 25, 'Garcom', 2, 300.00),
(48, 9, 25, 'Cozinheiro', 2, 300.00),
(49, 10, NULL, 'Barman', 2, 300.00),
(50, 10, NULL, 'Garcom', 2, 300.00),
(51, 10, 33, 'Cozinheiro', 2, 300.00),
(52, 11, NULL, 'Barman', 2, 300.00),
(53, 11, NULL, 'Garcom', 2, 300.00),
(54, 11, NULL, 'Cozinheiro', 2, 300.00),
(55, 13, NULL, 'Barman', 2, 300.00),
(56, 13, NULL, 'Garcom', 2, 300.00),
(57, 13, NULL, 'Cozinheiro', 2, 300.00),
(58, 14, NULL, 'Barman', 2, 300.00),
(59, 14, NULL, 'Garcom', 21, 3150.00),
(60, 14, NULL, 'Cozinheiro', 2, 300.00),
(61, 15, NULL, 'Barman', 2, 300.00),
(62, 15, NULL, 'Garcom', 2, 300.00),
(63, 15, NULL, 'Cozinheiro', 2, 300.00),
(64, 16, NULL, 'Barman', 2, 300.00),
(65, 16, NULL, 'Garcom', 2, 300.00),
(66, 16, NULL, 'Cozinheiro', 2, 300.00),
(67, 17, NULL, 'Barman', 2, 300.00),
(68, 17, NULL, 'Garcom', 2, 300.00),
(69, 17, NULL, 'Cozinheiro', 2, 300.00),
(70, 18, NULL, 'Barman', 2, 300.00),
(71, 18, NULL, 'Garcom', 2, 300.00),
(72, 18, NULL, 'Cozinheiro', 2, 300.00),
(73, 19, NULL, 'Barman', 2, 300.00),
(74, 19, NULL, 'Garcom', 2, 300.00),
(75, 19, NULL, 'Cozinheiro', 2, 300.00),
(77, 39, NULL, 'barmans', 1, 150.00),
(78, 39, NULL, 'garcons', 1, 150.00),
(79, 39, NULL, 'cozinheiros', 1, 150.00),
(81, 41, NULL, 'barmans', 1, 150.00),
(82, 41, NULL, 'garcons', 1, 150.00),
(83, 41, NULL, 'cozinheiros', 1, 150.00),
(84, 42, NULL, 'barmans', 2, 300.00),
(85, 42, NULL, 'garcons', 2, 300.00),
(86, 42, NULL, 'cozinheiros', 2, 300.00),
(87, 44, NULL, 'barmans', 1, 150.00),
(88, 44, NULL, 'garcons', 1, 150.00),
(89, 44, NULL, 'cozinheiros', 1, 150.00),
(90, 45, NULL, 'barmans', 2, 300.00),
(91, 45, NULL, 'garcons', 2, 300.00),
(92, 45, NULL, 'cozinheiros', 2, 300.00),
(93, 47, NULL, 'barmans', 2, 300.00),
(94, 47, NULL, 'garcons', 2, 300.00),
(95, 47, NULL, 'cozinheiros', 2, 300.00),
(96, 48, NULL, 'barmans', 1, 150.00),
(97, 48, NULL, 'garcons', 1, 150.00),
(98, 48, NULL, 'cozinheiros', 1, 150.00),
(99, 50, NULL, 'Barmam', 2, 300.00),
(100, 50, NULL, 'Garcom', 2, 300.00),
(101, 50, NULL, 'Cozinheiro', 2, 300.00),
(102, 51, NULL, 'Barmam', 2, 300.00),
(103, 51, NULL, 'Garcom', 2, 300.00),
(104, 51, NULL, 'Cozinheiro', 2, 300.00),
(105, 52, NULL, 'Barmam', 1, 150.00),
(106, 52, NULL, 'Garcom', 1, 150.00),
(107, 52, NULL, 'Cozinheiro', 1, 150.00),
(108, 53, NULL, 'Barmam', 2, 300.00),
(109, 53, NULL, 'Garcom', 2, 300.00),
(110, 53, NULL, 'Cozinheiro', 2, 300.00);

--
-- Acionadores `pedidos_servicos`
--
DELIMITER $$
CREATE TRIGGER `calcular_total_servicos` AFTER INSERT ON `pedidos_servicos` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10,2);

    -- Calcular o total de subtotais para o serviço
    SELECT SUM(subtotal) INTO total
    FROM pedidos_servicos
    WHERE idServicos = NEW.idServicos;

    -- Atualizar o campo totalServicos na tabela Servicos
    UPDATE servicos
    SET totalServicos = total
    WHERE id = NEW.idServicos;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `tipo` enum('salgado','bebida','doce') DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `status` enum('ativo','inativo','em falta') DEFAULT NULL,
  `precoUnitario` decimal(10,2) DEFAULT NULL,
  `dataCadastro` date DEFAULT NULL,
  `dataAtualizacao` date DEFAULT NULL,
  `dataRemocao` date DEFAULT NULL,
  `caminhoImagem` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `tipo`, `quantidade`, `status`, `precoUnitario`, `dataCadastro`, `dataAtualizacao`, `dataRemocao`, `caminhoImagem`) VALUES
(1, 'Coxinha de frango', 'Coxinha de frango', 'salgado', 20, 'ativo', 2.00, '2024-07-05', '2024-07-23', NULL, 'coxinha.jpg'),
(2, 'Brigadeiro', 'Brigadeiro brasileiro', 'doce', 20, 'ativo', 2.00, '2024-07-05', '2024-07-07', NULL, 'brigadeiro.jpg'),
(3, 'Suco de maracujá', 'Suco de maracujá', 'bebida', 20, 'ativo', 1.00, '2024-07-05', '2024-07-22', NULL, 'suco.jpg'),
(22, 'Empada de queijo', 'Empadinha', 'salgado', 100, 'ativo', 1.50, '2024-07-23', '2024-07-23', NULL, 'Empada de queijo.jpg'),
(23, 'Coca Cola', 'Refrigerante', 'bebida', 100, 'ativo', 2.50, '2024-07-23', '2024-07-23', NULL, 'Coca Cola.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receitas_itens`
--

CREATE TABLE `receitas_itens` (
  `id` int(10) NOT NULL,
  `idProdutos` int(10) DEFAULT NULL,
  `idMateriasPrimas` int(10) DEFAULT NULL,
  `quantidade` int(10) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `receitas_itens`
--

INSERT INTO `receitas_itens` (`id`, `idProdutos`, `idMateriasPrimas`, `quantidade`, `subtotal`) VALUES
(1, 1, 6, 50, 100.00),
(2, 1, 2, 5, 200.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `relatorios`
--

CREATE TABLE `relatorios` (
  `id` int(10) NOT NULL,
  `parametros` text DEFAULT NULL,
  `dataEmissao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(10) NOT NULL,
  `nome` enum('festa pequena','festa media','festa grande','apenas entrega','personalizado') DEFAULT NULL,
  `totalServicos` decimal(10,2) DEFAULT NULL,
  `dataCadastro` date DEFAULT current_timestamp(),
  `dataAtualizacao` date DEFAULT current_timestamp(),
  `dataRemocao` date DEFAULT NULL,
  `caminhoImagem` varchar(200) DEFAULT NULL,
  `duracaoHoras` int(11) DEFAULT NULL,
  `quantidadePessoas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `totalServicos`, `dataCadastro`, `dataAtualizacao`, `dataRemocao`, `caminhoImagem`, `duracaoHoras`, `quantidadePessoas`) VALUES
(1, 'festa pequena', 500.00, '2024-06-09', '2024-07-07', NULL, 'festa pequena.jpg', 7, 30),
(2, 'festa media', 1350.00, NULL, NULL, NULL, NULL, 7, 50),
(3, 'festa grande', 1800.00, NULL, NULL, NULL, NULL, 11, 100),
(4, 'apenas entrega', 100.00, NULL, '2024-07-23', NULL, NULL, 5, 100),
(6, 'personalizado', 6750.00, '2024-06-09', '2024-06-09', NULL, NULL, 5, 300),
(7, 'personalizado', 9900.00, '2024-06-09', '2024-06-09', NULL, NULL, 4, 500),
(8, 'personalizado', 9900.00, '2024-06-09', '2024-06-09', NULL, NULL, 6, 50),
(9, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 3, 100),
(10, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 12, 100),
(11, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 5, 100),
(12, 'personalizado', NULL, '2024-06-09', '2024-06-09', NULL, NULL, 8, 200),
(13, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, NULL, 0),
(14, 'personalizado', 3750.00, '2024-06-09', '2024-06-09', NULL, NULL, NULL, 0),
(15, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 14, NULL),
(16, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 14, NULL),
(17, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 14, NULL),
(18, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 14, NULL),
(19, 'personalizado', 900.00, '2024-06-09', '2024-06-09', NULL, NULL, 2, 14),
(20, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(21, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(22, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(23, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(24, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(25, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(26, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(27, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(28, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(29, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(30, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(31, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(32, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(33, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(34, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 22, 22),
(35, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(36, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(37, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 3, 50),
(38, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(39, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(40, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(41, 'personalizado', 450.00, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(42, 'personalizado', 900.00, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(43, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(44, 'personalizado', 450.00, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(45, 'personalizado', 900.00, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(46, 'personalizado', NULL, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(47, 'personalizado', 900.00, '2024-07-05', '2024-07-05', NULL, NULL, 2, 2),
(48, 'personalizado', 450.00, '2024-07-05', '2024-07-05', NULL, NULL, 1, 1),
(50, 'personalizado', 900.00, '2024-07-19', '2024-07-19', NULL, NULL, 11, 52),
(51, 'personalizado', 900.00, '2024-07-19', '2024-07-19', NULL, NULL, 2, 2),
(52, 'personalizado', 450.00, '2024-07-19', '2024-07-19', NULL, NULL, 1, 1),
(53, 'personalizado', 900.00, '2024-07-24', '2024-07-24', NULL, NULL, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `admpermissoes`
--
ALTER TABLE `admpermissoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFuncionario` (`idFuncionario`);

--
-- Índices para tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `enderecos_clientes`
--
ALTER TABLE `enderecos_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClientes` (`idClientes`);

--
-- Índices para tabela `esqueci_senha`
--
ALTER TABLE `esqueci_senha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idClientes` (`idClientes`);

--
-- Índices para tabela `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`);

--
-- Índices para tabela `formas_pagamento`
--
ALTER TABLE `formas_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `galeria_imagens`
--
ALTER TABLE `galeria_imagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `materias_primas_estoque`
--
ALTER TABLE `materias_primas_estoque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idFornecedor` (`idFornecedores`);

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `movimentacoes_materias_primas`
--
ALTER TABLE `movimentacoes_materias_primas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMateriaPrima` (`idMateriaPrima`);

--
-- Índices para tabela `movimentacoes_produtos`
--
ALTER TABLE `movimentacoes_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProdutos` (`idProdutos`);

--
-- Índices para tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `notificacoes_clientes`
--
ALTER TABLE `notificacoes_clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`),
  ADD KEY `idClientes` (`idClientes`),
  ADD KEY `idNotificacoes` (`idNotificacoes`);

--
-- Índices para tabela `notificacoes_colaboradores`
--
ALTER TABLE `notificacoes_colaboradores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`),
  ADD KEY `idFuncionario` (`idAdmins`),
  ADD KEY `idNotificacoes` (`idNotificacoes`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idClientes`),
  ADD KEY `idServicos` (`idServicos`),
  ADD KEY `fk_pedidos_enderecos` (`idEnderecos`);

--
-- Índices para tabela `pedidos_andamentos`
--
ALTER TABLE `pedidos_andamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`);

--
-- Índices para tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedidos` (`idPedidos`),
  ADD KEY `idProdutos` (`idProdutos`);

--
-- Índices para tabela `pedidos_servicos`
--
ALTER TABLE `pedidos_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idServicos` (`idServicos`),
  ADD KEY `idPedidos` (`idPedidos`),
  ADD KEY `idPedidos_2` (`idPedidos`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `receitas_itens`
--
ALTER TABLE `receitas_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProdutos` (`idProdutos`),
  ADD KEY `idMateriaPrima` (`idMateriasPrimas`);

--
-- Índices para tabela `relatorios`
--
ALTER TABLE `relatorios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `admpermissoes`
--
ALTER TABLE `admpermissoes`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `enderecos_clientes`
--
ALTER TABLE `enderecos_clientes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `esqueci_senha`
--
ALTER TABLE `esqueci_senha`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `formas_pagamento`
--
ALTER TABLE `formas_pagamento`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `galeria_imagens`
--
ALTER TABLE `galeria_imagens`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `materias_primas_estoque`
--
ALTER TABLE `materias_primas_estoque`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `movimentacoes_materias_primas`
--
ALTER TABLE `movimentacoes_materias_primas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `movimentacoes_produtos`
--
ALTER TABLE `movimentacoes_produtos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notificacoes`
--
ALTER TABLE `notificacoes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de tabela `notificacoes_clientes`
--
ALTER TABLE `notificacoes_clientes`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `notificacoes_colaboradores`
--
ALTER TABLE `notificacoes_colaboradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de tabela `pedidos_andamentos`
--
ALTER TABLE `pedidos_andamentos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `pedidos_servicos`
--
ALTER TABLE `pedidos_servicos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `receitas_itens`
--
ALTER TABLE `receitas_itens`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `relatorios`
--
ALTER TABLE `relatorios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `admpermissoes`
--
ALTER TABLE `admpermissoes`
  ADD CONSTRAINT `admpermissoes_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `admins` (`id`);

--
-- Limitadores para a tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `enderecos_clientes`
--
ALTER TABLE `enderecos_clientes`
  ADD CONSTRAINT `enderecos_clientes_ibfk_1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`id`);

--
-- Limitadores para a tabela `esqueci_senha`
--
ALTER TABLE `esqueci_senha`
  ADD CONSTRAINT `esqueci_senha_ibfk_1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`id`);

--
-- Limitadores para a tabela `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `materias_primas_estoque`
--
ALTER TABLE `materias_primas_estoque`
  ADD CONSTRAINT `materias_primas_estoque_ibfk_1` FOREIGN KEY (`idFornecedores`) REFERENCES `fornecedores` (`id`);

--
-- Limitadores para a tabela `movimentacoes_materias_primas`
--
ALTER TABLE `movimentacoes_materias_primas`
  ADD CONSTRAINT `movimentacoes_materias_primas_ibfk_1` FOREIGN KEY (`idMateriaPrima`) REFERENCES `materias_primas_estoque` (`id`);

--
-- Limitadores para a tabela `movimentacoes_produtos`
--
ALTER TABLE `movimentacoes_produtos`
  ADD CONSTRAINT `movimentacoes_produtos_ibfk_1` FOREIGN KEY (`idProdutos`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `notificacoes_clientes`
--
ALTER TABLE `notificacoes_clientes`
  ADD CONSTRAINT `notificacoes_clientes_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `notificacoes_clientes_ibfk_2` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `notificacoes_clientes_ibfk_3` FOREIGN KEY (`idNotificacoes`) REFERENCES `notificacoes` (`id`);

--
-- Limitadores para a tabela `notificacoes_colaboradores`
--
ALTER TABLE `notificacoes_colaboradores`
  ADD CONSTRAINT `notificacoes_colaboradores_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `notificacoes_colaboradores_ibfk_2` FOREIGN KEY (`idAdmins`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `notificacoes_colaboradores_ibfk_3` FOREIGN KEY (`idNotificacoes`) REFERENCES `notificacoes` (`id`);

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_enderecos` FOREIGN KEY (`idEnderecos`) REFERENCES `enderecos_clientes` (`id`),
  ADD CONSTRAINT `idServicos` FOREIGN KEY (`idServicos`) REFERENCES `servicos` (`id`),
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idClientes`) REFERENCES `clientes` (`id`);

--
-- Limitadores para a tabela `pedidos_andamentos`
--
ALTER TABLE `pedidos_andamentos`
  ADD CONSTRAINT `pedidos_andamentos_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `pedidos_produtos_ibfk_1` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedidos_produtos_ibfk_2` FOREIGN KEY (`idProdutos`) REFERENCES `produtos` (`id`);

--
-- Limitadores para a tabela `pedidos_servicos`
--
ALTER TABLE `pedidos_servicos`
  ADD CONSTRAINT `pedidos_servicos_ibfk_1` FOREIGN KEY (`idServicos`) REFERENCES `servicos` (`id`),
  ADD CONSTRAINT `pedidos_servicos_ibfk_2` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`id`);

--
-- Limitadores para a tabela `receitas_itens`
--
ALTER TABLE `receitas_itens`
  ADD CONSTRAINT `receitas_itens_ibfk_1` FOREIGN KEY (`idProdutos`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `receitas_itens_ibfk_2` FOREIGN KEY (`idMateriasPrimas`) REFERENCES `materias_primas_estoque` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
