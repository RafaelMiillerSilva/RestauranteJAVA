-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/11/2025 às 12:00
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurantedb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cardapios`
--

CREATE TABLE `cardapios` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `composicao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cardapios`
--

INSERT INTO `cardapios` (`id`, `name`, `composicao`, `preco`) VALUES
(1, 'Hambúrguer Java Supreme', '2 hambúrgueres 180g, queijo cheddar, bacon crocante, alface americana, tomate, cebola roxa, molho especial da casa', 35.90),
(2, 'X-Tudo Python', '1 hambúrguer 180g, 2 fatias de queijo mussarela, presunto, bacon, ovo, milho, ervilha, batata palha, alface, tomate', 32.50),
(3, 'Cheese Bacon JavaScript', '2 hambúrgueres 150g, 3 fatias de queijo cheddar, 6 tiras de bacon, cebola caramelizada, molho barbecue', 38.90),
(4, 'Veggie TypeScript', 'Hambúrguer vegetal de grão-de-bico, queijo vegano, rúcula, tomate seco, cebola roxa, maionese vegana', 29.90),
(5, 'X-Salada Classic', '1 hambúrguer 150g, queijo mussarela, alface, tomate, maionese caseira', 22.90),
(6, 'Frango Crispy HTML', 'Filé de frango empanado, queijo prato, alface, tomate, maionese de ervas', 27.50),
(7, 'Smash Burger CSS', '2 hambúrgueres smash 100g, queijo americano, picles, cebola, molho especial', 31.90),
(8, 'Monster Burger React', '3 hambúrgueres 180g, 4 fatias de queijo cheddar, bacon, onion rings, molho barbecue picante', 45.90),
(9, 'Hot Dog Java', 'Salsicha especial, purê de batata, milho, ervilha, batata palha, queijo ralado, molhos', 18.90),
(10, 'Batata Frita Grande', 'Batata frita crocante, temperada com sal e ervas', 15.90),
(11, 'Onion Rings', '10 unidades de anéis de cebola empanados e fritos', 16.50),
(12, 'Refrigerante Lata 350ml', 'Coca-Cola, Guaraná, Fanta, Sprite', 6.50),
(13, 'Suco Natural 500ml', 'Laranja, Limão, Morango, Abacaxi', 12.90),
(14, 'Milkshake Java', 'Chocolate, Morango, Baunilha - 400ml', 18.90),
(15, 'Combo Java Developer', 'Hambúrguer Java Supreme + Batata Grande + Refrigerante', 52.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `name`, `email`, `phone`) VALUES
(1, 'Atenor Silva', 'atenor.silva@gmail.com', '(18) 99879-0867'),
(2, 'Genostor Santos', 'genostor@gmail.com', '(18) 99645-9890'),
(3, 'Cláudio Oliveira', 'claudio.oliveira@gmail.com', '(19) 83813-8183'),
(4, 'Maria Fernanda Costa', 'maria.costa@hotmail.com', '(11) 98765-4321'),
(5, 'João Pedro Almeida', 'joao.almeida@outlook.com', '(21) 97654-3210'),
(6, 'Ana Carolina Souza', 'ana.souza@gmail.com', '(47) 99876-5432'),
(7, 'Ricardo Mendes', 'ricardo.mendes@yahoo.com', '(85) 98123-4567'),
(8, 'Juliana Rocha', 'juliana.rocha@gmail.com', '(31) 99234-5678'),
(9, 'Fernando Lima', 'fernando.lima@hotmail.com', '(41) 98345-6789'),
(10, 'Camila Santos', 'camila.santos@gmail.com', '(51) 97456-7890'),
(11, 'Paulo Roberto Silva', 'paulo.roberto@outlook.com', '(61) 99567-8901'),
(12, 'Beatriz Alves', 'beatriz.alves@gmail.com', '(71) 98678-9012'),
(13, 'Lucas Ferreira', 'lucas.ferreira@yahoo.com', '(81) 97789-0123'),
(14, 'Patrícia Gomes', 'patricia.gomes@gmail.com', '(62) 99890-1234'),
(15, 'Rodrigo Martins', 'rodrigo.martins@hotmail.com', '(27) 98901-2345');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contatos`
--

INSERT INTO `contatos` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`) VALUES
(1, 'Carlos Eduardo', 'carlos.eduardo@gmail.com', '(11) 98765-1234', 'Suporte', 'Gostaria de saber quais são as opções vegetarianas do cardápio. Obrigado!', '2025-11-15 14:30:00'),
(2, 'Mariana Silva', 'mariana.silva@hotmail.com', '(21) 99876-5432', 'Feedback', 'Adorei o Hambúrguer Java Supreme! Melhor hambúrguer que já comi. Parabéns pela qualidade!', '2025-11-16 10:15:00'),
(3, 'Roberto Santos', 'roberto.santos@yahoo.com', '(31) 97654-3210', 'Vendas', 'Gostaria de fazer um pedido para festa de 30 pessoas. Vocês fazem entregas para eventos?', '2025-11-16 16:45:00'),
(4, 'Fernanda Costa', 'fernanda.costa@gmail.com', '(41) 98123-4567', 'Outros', 'Qual o tempo médio de entrega para o bairro Centro?', '2025-11-17 09:20:00'),
(5, 'Bruno Oliveira', 'bruno.oliveira@outlook.com', '(51) 99234-5678', 'Suporte', 'Tive um problema com meu último pedido. O hambúrguer veio frio. Gostaria de uma solução.', '2025-11-17 18:00:00'),
(6, 'Amanda Rodrigues', 'amanda.rodrigues@gmail.com', '(61) 98345-6789', 'Feedback', 'Sugestão: seria ótimo ter opção de hambúrguer sem glúten no cardápio!', '2025-11-18 11:30:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `encomendas`
--

CREATE TABLE `encomendas` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cardapio_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL DEFAULT 1,
  `observacoes` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pendente',
  `data_encomenda` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `encomendas`
--

INSERT INTO `encomendas` (`id`, `cliente_id`, `cardapio_id`, `quantidade`, `observacoes`, `status`, `data_encomenda`) VALUES
(1, 3, 1, 2, 'Sem cebola, por favor', 'Entregue', '2025-11-15 19:30:00'),
(2, 1, 3, 1, 'Ponto da carne mal passado', 'Entregue', '2025-11-15 20:15:00'),
(3, 5, 2, 1, 'Sem milho e ervilha', 'Entregue', '2025-11-16 12:45:00'),
(4, 7, 8, 1, 'Bem passado, molho extra', 'Entregue', '2025-11-16 13:20:00'),
(5, 2, 15, 2, 'Combo completo', 'Entregue', '2025-11-16 19:00:00'),
(6, 9, 4, 1, NULL, 'Entregue', '2025-11-16 20:30:00'),
(7, 4, 1, 1, 'Bastante molho especial', 'Pronto', '2025-11-17 11:00:00'),
(8, 11, 7, 2, 'Um sem picles', 'Pronto', '2025-11-17 12:15:00'),
(9, 6, 6, 1, 'Crocante', 'Pronto', '2025-11-17 18:45:00'),
(10, 13, 10, 3, 'Bem crocante', 'Em Preparo', '2025-11-17 19:30:00'),
(11, 8, 3, 1, 'Bacon extra', 'Em Preparo', '2025-11-17 20:00:00'),
(12, 15, 5, 2, NULL, 'Em Preparo', '2025-11-17 20:45:00'),
(13, 10, 1, 1, 'Sem tomate', 'Pendente', '2025-11-18 10:30:00'),
(14, 12, 14, 2, '1 chocolate, 1 morango', 'Pendente', '2025-11-18 11:00:00'),
(15, 14, 15, 1, 'Combo com Coca-Cola', 'Pendente', '2025-11-18 11:15:00'),
(16, 3, 8, 1, 'Bem apimentado', 'Pendente', '2025-11-18 11:30:00'),
(17, 5, 11, 2, 'Bem crocante', 'Pendente', '2025-11-18 11:45:00'),
(18, 1, 2, 1, 'Tudo completo', 'Pendente', '2025-11-18 12:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cardapios`
--
ALTER TABLE `cardapios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente` (`cliente_id`),
  ADD KEY `fk_cardapio` (`cardapio_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cardapios`
--
ALTER TABLE `cardapios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `encomendas`
--
ALTER TABLE `encomendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `encomendas`
--
ALTER TABLE `encomendas`
  ADD CONSTRAINT `fk_cardapio` FOREIGN KEY (`cardapio_id`) REFERENCES `cardapios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;