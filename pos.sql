-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Tempo de geração: 02/06/2017 às 12:00
-- Versão do servidor: 5.5.49-0+deb8u1
-- Versão do PHP: 5.6.22-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `pos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_categories`
--

CREATE TABLE IF NOT EXISTS `tec_categories` (
`id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'SERVIÇOS RAPIDOS', 'bdbc68aa9847d3dad074112ca58a3d42.jpg'),
(2, 'G02', 'GRÁFICA RAPIDA', 'e3c45122fa6a568f0a5a1e24f0c03968.jpg'),
(3, '01', 'testeeeeeee', 'no_image.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_combo_items`
--

CREATE TABLE IF NOT EXISTS `tec_combo_items` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_combo_items`
--

INSERT INTO `tec_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `price`, `cost`) VALUES
(5, 18, '03', 1.0000, NULL, NULL),
(6, 18, '02', 1.0000, NULL, NULL),
(7, 18, '0015', 1.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_customers`
--

CREATE TABLE IF NOT EXISTS `tec_customers` (
`id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Cliente Padrão', '9999999999', '99999999', '012345678', 'cliente@pdvparatodos.com.br'),
(2, 'Francisco', '', '', '', 'chico@gmail.com'),
(3, 'Aline', '', '', '', ''),
(4, 'teste01', '', '', '', ''),
(5, 'Caio Davinis', '05406636545', '34622705', '79999506663', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_expenses`
--

CREATE TABLE IF NOT EXISTS `tec_expenses` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,2) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_gift_cards`
--

CREATE TABLE IF NOT EXISTS `tec_gift_cards` (
`id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,2) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,2) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_gift_cards`
--

INSERT INTO `tec_gift_cards` (`id`, `date`, `card_no`, `value`, `customer_id`, `balance`, `expiry`, `created_by`) VALUES
(8, '2016-04-13 19:13:20', '3301 5200 7106 8984', 200.00, NULL, 200.00, NULL, 4),
(9, '2017-06-01 14:57:50', '4111 1111 1111 1111', 30.00, NULL, 30.00, NULL, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_groups`
--

CREATE TABLE IF NOT EXISTS `tec_groups` (
`id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_login_attempts`
--

CREATE TABLE IF NOT EXISTS `tec_login_attempts` (
`id` mediumint(8) unsigned NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_payments`
--

CREATE TABLE IF NOT EXISTS `tec_payments` (
`id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,2) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,2) DEFAULT '0.00',
  `pos_balance` decimal(25,2) DEFAULT '0.00',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`) VALUES
(1, '2015-11-02 13:47:00', 1, 1, NULL, 'CC', '', '', '', '', '', 'Visa', 4.00, NULL, 1, NULL, '', 0.00, 0.00, '', '', NULL, NULL),
(2, '2015-11-03 12:43:13', 2, 1, NULL, 'cash', '', '', '', '', '', '', 16.00, NULL, 1, NULL, '', 20.00, 4.00, '', NULL, NULL, NULL),
(3, '2015-12-12 19:10:09', 4, 1, NULL, 'cash', '', '', '', '', '', '', 10.99, NULL, 2, NULL, '', 50.00, 39.01, '', NULL, NULL, NULL),
(4, '2015-12-12 19:13:40', 5, 1, NULL, 'cash', '', '', '', '', '', '', 32.97, NULL, 2, NULL, '', 70.00, 37.03, '', NULL, NULL, NULL),
(5, '2016-01-22 17:29:59', 6, 1, NULL, 'cash', '', '', '', '', '', '', 20.00, NULL, 1, NULL, '', 20.00, 0.00, '', NULL, NULL, NULL),
(6, '2016-01-25 23:15:47', 7, 1, NULL, 'cash', '', '', '', '', '', '', 4.00, NULL, 1, NULL, '', 10.00, 6.00, '', NULL, NULL, NULL),
(7, '2016-01-25 23:50:55', 8, 1, NULL, 'cash', '', '', '', '', '', '', 4.00, NULL, 1, NULL, '', 10.00, 6.00, '', NULL, NULL, NULL),
(8, '2016-01-25 23:54:16', 10, 1, NULL, 'cash', '', '', '', '', '', '', 6.00, NULL, 1, NULL, '', 50.00, 44.00, '', NULL, NULL, NULL),
(9, '2016-01-26 00:00:29', 11, 1, NULL, 'cash', '', '', '', '', '', '', 4.00, NULL, 1, NULL, '', 4.00, 6.00, '', NULL, NULL, NULL),
(10, '2016-01-26 00:02:46', 12, 1, NULL, 'cash', '', '', '', '', '', '', 7.00, NULL, 1, NULL, '', 10.00, 3.00, '', NULL, NULL, NULL),
(11, '2016-01-26 00:04:10', 13, 1, NULL, 'cash', '', '', '', '', '', '', 2.00, NULL, 1, NULL, '', 5.00, 3.00, '', NULL, NULL, NULL),
(12, '2016-01-26 00:04:47', 14, 1, NULL, 'cash', '', '', '', '', '', '', 8.00, NULL, 1, NULL, '', 10.00, 2.00, '', NULL, NULL, NULL),
(13, '2016-01-26 00:11:13', 15, 1, NULL, 'cash', '', '', '', '', '', '', 24.00, NULL, 1, NULL, '', 50.00, 26.00, '', NULL, NULL, NULL),
(14, '2016-03-05 15:17:18', 16, 1, NULL, 'cash', '', '', '', '', '', '', 4.00, NULL, 1, NULL, '', 10.00, 6.00, '', NULL, NULL, NULL),
(15, '2016-03-05 23:35:02', 13, 1, NULL, 'cash', '', '', '', '', '', '', 8.00, NULL, 2, NULL, '', 8.00, 0.00, '', NULL, NULL, NULL),
(16, '2016-03-05 23:37:09', 14, 1, NULL, 'cash', '', '', '', '', '', '', 12.00, NULL, 2, NULL, '', 50.00, 38.00, '', NULL, NULL, NULL),
(17, '2016-03-06 06:27:05', 16, 1, NULL, 'cash', '', '', '', '', '', '', 8.00, NULL, 3, NULL, '', 20.00, 12.00, '', NULL, NULL, NULL),
(18, '2016-03-08 19:35:11', 17, 1, NULL, 'cash', '', '', '', '', '', '', 5.00, NULL, 3, NULL, '', 20.00, 15.00, '', NULL, NULL, NULL),
(19, '2016-03-30 23:13:15', 18, 1, NULL, 'cash', '', '', '', '', '', 'MasterCard', 4.00, NULL, 4, NULL, '', 4.00, 0.00, '', NULL, NULL, NULL),
(20, '2016-03-31 00:02:11', 19, 1, NULL, 'cash', '', '', '', '', '', '', 10.00, NULL, 5, NULL, '', 20.00, 10.00, '', NULL, NULL, NULL),
(21, '2016-03-31 00:24:02', 20, 1, NULL, 'CC', '', '', '', '', '', 'Visa', 4.00, NULL, 5, NULL, '', 4.00, 0.00, '', NULL, NULL, NULL),
(22, '2016-03-31 00:43:17', 21, 1, NULL, 'cash', '', '', '', '', '', '', 2.00, NULL, 5, NULL, '', 20.00, 18.00, '', NULL, NULL, NULL),
(23, '2016-03-31 15:43:17', 22, 1, NULL, 'cash', '', '', '', '', '', '', 7.00, NULL, 5, NULL, '', 10.00, 3.00, '', NULL, NULL, NULL),
(24, '2016-03-31 20:15:29', 23, 1, NULL, 'cash', '', '', '', '', '', '', 2.00, NULL, 5, NULL, '', 2.00, 0.00, '', NULL, NULL, NULL),
(25, '2016-03-31 21:06:07', 25, 1, NULL, 'cash', '', '', '', '', '', '', 32.00, NULL, 5, NULL, '', 32.00, 0.00, '', NULL, NULL, NULL),
(26, '2016-03-31 23:59:48', 26, 1, NULL, 'cash', '', '', '', '', '', '', 10.00, NULL, 5, NULL, '', 100.00, 90.00, '', NULL, NULL, NULL),
(27, '2016-04-01 00:04:54', 27, 3, NULL, 'cash', '', '', '', '', '', '', 22.00, NULL, 5, NULL, '', 100.00, 78.00, '', NULL, NULL, NULL),
(28, '2016-04-01 00:06:03', 28, 3, NULL, 'cash', '', '', '', '', '', '', 20.00, NULL, 5, NULL, '', 20.00, 0.00, '', NULL, NULL, NULL),
(29, '2016-04-01 00:06:56', 29, 1, NULL, 'gift_card', '', '', '', '', '', '', 4.00, NULL, 5, NULL, '', 4.00, 0.00, '2020 2020 2020 2020', NULL, NULL, NULL),
(30, '2016-04-01 00:08:17', 30, 1, NULL, 'gift_card', '', '', '', '', '', '', 16.00, NULL, 5, NULL, '', 16.00, -16.00, '2020 2020 2020 2020', NULL, NULL, NULL),
(31, '2016-04-01 02:52:53', 31, 1, NULL, 'cash', '', '', '', '', '', '', 0.25, NULL, 6, NULL, '', 1.00, 0.75, '', NULL, NULL, NULL),
(32, '2016-04-01 13:50:42', 32, 2, NULL, 'cash', '', '', '', '', '', '', 2.75, NULL, 5, NULL, '', 10.00, 7.25, '', NULL, NULL, NULL),
(33, '2016-04-10 13:49:45', 33, 1, NULL, 'cash', '', '', '', '', '', '', 0.75, NULL, 7, NULL, '', 0.75, 4.25, '', NULL, NULL, NULL),
(34, '2016-04-10 13:50:35', 34, 1, NULL, 'cash', '', '', '', '', '', '', 6.25, NULL, 7, NULL, '', 20.00, 13.75, '', NULL, NULL, NULL),
(35, '2016-04-10 14:26:48', 35, 1, NULL, 'cash', '', '', '', '', '', '', 5.25, NULL, 7, NULL, '', 10.00, 4.75, '', NULL, NULL, NULL),
(36, '2016-04-10 14:33:00', 36, 2, NULL, 'cash', '', '', '', '', '', 'Visa', 4.25, NULL, 7, NULL, '', 0.00, 0.00, '', '', NULL, NULL),
(37, '2017-06-01 15:08:20', 37, 1, NULL, 'cash', '', '', '', '', '', '', 1.50, NULL, 9, NULL, '', 10.00, 8.50, '', NULL, NULL, NULL),
(38, '2017-06-01 18:56:42', 38, 1, NULL, 'gift_card', '', '', '', '', '', 'Visa', 26.50, NULL, 9, NULL, '', 26.50, 13.50, '', NULL, NULL, NULL),
(39, '2017-06-02 14:36:50', 40, 1, NULL, 'Cheque', '123', '', '', '', '', '', 12.00, NULL, 9, NULL, '', 12.00, 18.00, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_products`
--

CREATE TABLE IF NOT EXISTS `tec_products` (
`id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,2) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,2) DEFAULT '0.00',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(23, '02', 'IMPRESSÃO - P/B', 1, 0.50, '99ba15cb71eafc2bf6675c47eda93853.gif', '0', 0.10, 1, 596.00, 'code39', 'standard', 'PRETO E BRANCO - A4', 0.00),
(24, '03', 'XEROX - COLORIDA', 1, 2.00, '1c485ac2a3a40d5065a8ff8736311008.gif', '0', 0.10, 1, 2.00, 'code39', 'standard', 'A4', 0.00),
(25, '001', 'Produto 1', 1, 1.00, 'no_image.png', '0', 0.30, 0, 94.00, 'code39', 'standard', 'Detalhes do produto 1', 50.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_purchases`
--

CREATE TABLE IF NOT EXISTS `tec_purchases` (
`id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`) VALUES
(1, '', '2015-11-02 13:51:00', '', 30.00, NULL, NULL, NULL),
(2, '', '2016-01-25 23:19:00', '', 40.00, NULL, NULL, NULL),
(3, '', '2016-01-26 00:09:00', '', 40.00, NULL, NULL, NULL),
(5, '', '2016-04-13 11:38:00', '', 0.10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_purchase_items`
--

CREATE TABLE IF NOT EXISTS `tec_purchase_items` (
`id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `cost` decimal(25,2) NOT NULL,
  `subtotal` decimal(25,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_purchase_items`
--

INSERT INTO `tec_purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `cost`, `subtotal`) VALUES
(1, 1, 6, 10.00, 3.00, 30.00),
(2, 2, 14, 10.00, 4.00, 40.00),
(3, 3, 1, 10.00, 4.00, 40.00),
(7, 5, 23, 1.00, 0.10, 0.10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_registers`
--

CREATE TABLE IF NOT EXISTS `tec_registers` (
`id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,2) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,2) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2015-11-02 12:39:22', 1, 0.00, 'close', 0.00, 0, 1, 0.00, 0, 1, '', '2015-11-02 13:49:29', NULL, 1),
(2, '2015-11-02 14:00:24', 1, 0.00, 'close', 36.00, 0, 0, 36.00, 0, 0, '', '2016-01-25 23:11:28', NULL, 1),
(3, '2015-12-12 18:59:48', 2, 50.00, 'close', 101.96, 0, 0, 101.96, 0, 0, '', '2016-03-05 23:36:08', NULL, 2),
(4, '2016-01-25 23:12:25', 1, 0.00, 'close', 2.00, 0, 0, 2.00, 0, 0, '', '2016-01-25 23:28:28', '0', 1),
(5, '2016-01-25 23:46:53', 1, 0.00, 'close', 0.00, 0, 0, 0.00, 0, 0, '', '2016-01-25 23:48:44', NULL, 1),
(6, '2016-01-25 23:50:22', 1, 100.00, 'close', 110.00, 0, 0, 110.00, 0, 0, '', '2016-01-25 23:56:02', NULL, 1),
(7, '2016-01-25 23:59:31', 1, 100.00, 'close', 104.00, 0, 0, 104.00, 0, 0, '', '2016-01-26 00:01:16', NULL, 1),
(8, '2016-01-26 00:01:58', 1, 100.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2016-03-05 23:36:43', 2, 200.00, 'close', 212.00, 0, 0, 212.00, 0, 0, '', '2016-03-08 01:40:06', NULL, 2),
(10, '2016-03-06 06:17:16', 3, 200.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2016-03-29 14:18:24', 4, 100.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2016-03-29 14:18:24', 4, 100.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2016-03-29 14:31:12', 5, 0.00, 'close', 19.00, 0, 1, 19.00, 0, 1, '', '2016-03-31 20:10:01', NULL, 5),
(14, '2016-03-31 20:14:17', 5, 100.00, 'close', 134.00, 0, 0, 134.00, 0, 0, '', '2016-03-31 21:07:22', NULL, 5),
(15, '2016-03-31 23:59:11', 5, 100.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2016-04-01 02:07:39', 6, 100.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2016-04-10 13:03:46', 7, 50.00, 'close', 57.00, 0, 0, 57.00, 0, 0, '', '2016-04-10 14:12:49', NULL, 7),
(18, '2016-04-10 14:22:29', 7, 50.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2017-04-03 16:16:35', 8, 10.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2017-06-01 15:01:37', 9, 500.00, 'close', 501.50, 0, 0, 501.50, 0, 0, '', '2017-06-01 18:20:50', NULL, 9),
(21, '2017-06-01 18:49:48', 9, 0.00, 'close', 0.00, 0, 0, 0.00, 0, 0, '', '2017-06-01 20:14:40', NULL, 9),
(22, '2017-06-01 20:15:37', 9, 0.00, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_sales`
--

CREATE TABLE IF NOT EXISTS `tec_sales` (
`id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`) VALUES
(1, '2015-11-02 11:42:47', 1, 'Cliente Padr?o', 4.00, 0.00, NULL, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 4.00, 2, 2.00, 4.00, 1, 1, '2015-11-02 11:47:25', '', 'paid', 0.00),
(2, '2015-11-03 10:43:13', 1, 'Cliente Padr?o', 16.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 16.00, 5, 6.00, 16.00, 1, NULL, NULL, '', 'paid', 0.00),
(3, '2015-12-12 17:08:16', 1, 'Cliente Padr?o', 10.47, 0.00, NULL, 0.00, 0.00, 0.52, '0%', 0.00, 0.52, 10.99, 1, 1.00, 0.00, 2, NULL, NULL, '', 'due', 0.00),
(4, '2015-12-12 17:10:09', 1, 'Cliente Padr?o', 10.99, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 10.99, 3, 3.00, 10.99, 2, NULL, NULL, '', 'paid', 0.00),
(5, '2015-12-12 17:13:40', 1, 'Cliente Padr?o', 31.41, 0.00, NULL, 0.00, 0.00, 1.56, '0%', 0.00, 1.56, 32.97, 1, 3.00, 32.97, 2, NULL, NULL, '', 'paid', 0.00),
(6, '2016-01-22 15:29:59', 1, 'Cliente Padr?o', 20.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 20.00, 6, 8.00, 20.00, 1, NULL, NULL, '', 'paid', 0.00),
(8, '2016-01-25 21:50:55', 1, 'Cliente Padr?o', 4.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 4.00, 2, 2.00, 4.00, 1, NULL, NULL, '', 'paid', 0.00),
(9, '2016-01-25 21:52:35', 1, 'Cliente Padr?o', 6.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 6.00, 3, 3.00, 6.00, 1, NULL, NULL, '', 'paid', 0.00),
(10, '2016-01-25 21:54:16', 1, 'Cliente Padr?o', 6.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 6.00, 3, 3.00, 6.00, 1, NULL, NULL, '', 'paid', 0.00),
(11, '2016-01-25 22:00:29', 1, 'Cliente Padr?o', 4.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 4.00, 2, 2.00, 4.00, 1, NULL, NULL, '', 'paid', 0.00),
(12, '2016-01-25 22:02:46', 1, 'Cliente Padr?o', 7.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 7.00, 3, 3.00, 7.00, 1, NULL, NULL, '', 'paid', 0.00),
(13, '2016-03-05 20:35:02', 1, 'Cliente Padr?o', 8.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 8.00, 3, 3.00, 8.00, 2, NULL, NULL, '', 'paid', 0.00),
(14, '2016-03-05 20:37:09', 1, 'Cliente Padr?o', 12.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 12.00, 3, 6.00, 12.00, 2, NULL, NULL, '', 'paid', 0.00),
(15, '2016-03-06 03:19:06', 1, 'Cliente Padr?o', 8.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 8.00, 3, 4.00, 0.00, 3, NULL, NULL, '', 'due', 0.00),
(16, '2016-03-06 03:27:05', 1, 'Cliente Padr?o', 8.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 8.00, 2, 4.00, 8.00, 3, NULL, NULL, '', 'paid', 0.00),
(17, '2016-03-08 16:35:11', 1, 'Cliente Padr?o', 5.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 5.00, 3, 3.00, 5.00, 3, NULL, NULL, '', 'paid', 0.00),
(18, '2016-03-30 20:13:15', 1, 'Cliente Padr?o', 4.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 4.00, 2, 2.00, 4.00, 4, NULL, NULL, '', 'paid', 0.00),
(19, '2016-03-30 21:02:11', 1, 'Cliente Padr?o', 10.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 10.00, 2, 5.00, 10.00, 5, NULL, NULL, '', 'paid', 0.00),
(20, '2016-03-30 21:24:02', 1, 'Cliente Padr?o', 4.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 4.00, 2, 2.00, 4.00, 5, NULL, NULL, '', 'paid', 0.00),
(22, '2016-03-31 12:43:17', 1, 'Cliente Padr?o', 7.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 7.00, 3, 4.00, 7.00, 5, NULL, NULL, '', 'paid', 0.00),
(27, '2016-03-31 21:04:54', 3, 'Aline', 22.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 22.00, 2, 11.00, 22.00, 5, NULL, NULL, '', 'paid', 0.00),
(31, '2016-03-31 23:52:53', 1, 'Cliente Padrão', 0.25, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 0.25, 1, 1.00, 0.25, 6, NULL, NULL, '', 'paid', 0.00),
(32, '2016-04-01 10:50:42', 2, 'Francisco', 2.75, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 2.75, 3, 3.00, 2.75, 5, NULL, NULL, '', 'paid', 0.00),
(33, '2016-04-10 10:49:45', 1, 'Cliente Padrão', 0.75, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 0.75, 2, 2.00, 0.75, 7, NULL, NULL, '', 'paid', 0.00),
(34, '2016-04-10 10:50:35', 1, 'Cliente Padrão', 6.25, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 6.25, 2, 4.00, 6.25, 7, NULL, NULL, '', 'paid', 0.00),
(35, '2016-04-10 11:26:48', 1, 'Cliente Padrão', 5.25, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 5.25, 3, 5.00, 5.25, 7, NULL, NULL, '', 'paid', 0.00),
(37, '2017-06-01 12:08:20', 1, 'Cliente Padrão', 1.50, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 1.50, 1, 3.00, 1.50, 9, NULL, NULL, 'teste', 'paid', 0.00),
(38, '2017-06-01 15:56:42', 1, 'Cliente Padrão', 26.50, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 26.50, 2, 20.00, 26.50, 9, NULL, NULL, '', 'paid', 0.00),
(39, '2017-06-02 11:36:36', 1, 'Cliente Padrão', 12.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 12.00, 3, 9.00, 12.00, 9, NULL, NULL, '', 'paid', 0.00),
(40, '2017-06-02 11:36:50', 1, 'Cliente Padrão', 12.00, 0.00, NULL, 0.00, 0.00, 0.00, '0%', 0.00, 0.00, 12.00, 3, 9.00, 12.00, 9, NULL, NULL, '', 'paid', 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_sale_items`
--

CREATE TABLE IF NOT EXISTS `tec_sale_items` (
`id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL,
  `cost` decimal(25,2) DEFAULT '0.00'
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`) VALUES
(3, 1, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(4, 1, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(5, 2, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(6, 2, 3, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(7, 2, 9, 2.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 8.00, 4.00, 6.00),
(8, 2, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(9, 2, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(10, 3, 18, 1.00, 10.99, 10.47, '0', 0.00, 5, 0.52, 10.99, 10.99, 8.71),
(11, 4, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(12, 4, 19, 1.00, 7.99, 7.99, '0', 0.00, 0, 0.00, 7.99, 7.99, 4.72),
(13, 4, 20, 1.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 1.00, 1.00, 0.27),
(14, 5, 18, 3.00, 10.99, 10.47, '0', 0.00, 5, 1.56, 32.97, 10.99, 8.71),
(15, 6, 6, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(16, 6, 10, 1.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 4.00, 4.00, 6.00),
(17, 6, 11, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(18, 6, 14, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 4.00),
(19, 6, 15, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 4.00),
(20, 6, 17, 1.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 4.00, 4.00, 6.00),
(23, 8, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(24, 8, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(25, 9, 4, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(26, 9, 8, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(27, 9, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(28, 10, 8, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(29, 10, 11, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(30, 10, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(31, 11, 3, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(32, 11, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(33, 12, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(34, 12, 2, 1.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 1.00, 1.00, 3.00),
(35, 12, 17, 1.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 4.00, 4.00, 6.00),
(36, 13, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(37, 14, 10, 1.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 4.00, 4.00, 6.00),
(38, 14, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(39, 14, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(40, 15, 1, 12.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 24.00, 2.00, 4.00),
(41, 16, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(42, 16, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(43, 13, 4, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(44, 13, 10, 1.00, 4.00, 4.00, '0', 0.00, 0, 0.00, 4.00, 4.00, 6.00),
(45, 13, 11, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(46, 14, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(47, 14, 15, 4.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 8.00, 2.00, 4.00),
(48, 14, 16, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(49, 15, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(50, 15, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(51, 15, 16, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 3.00),
(52, 16, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(53, 16, 15, 3.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 6.00, 2.00, 4.00),
(54, 17, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(55, 17, 2, 1.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 1.00, 1.00, 3.00),
(56, 17, 4, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(57, 18, 14, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(58, 18, 15, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(59, 19, 14, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 4.00),
(60, 19, 16, 3.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 6.00, 2.00, 3.00),
(61, 20, 1, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(62, 20, 16, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 3.00),
(64, 22, 2, 1.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 1.00, 1.00, 3.00),
(65, 22, 8, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 4.00),
(66, 22, 14, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 4.00),
(78, 27, 14, 6.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 12.00, 2.00, 4.00),
(79, 27, 15, 5.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 10.00, 2.00, 4.00),
(83, 31, 22, 1.00, 0.25, 0.25, '0', 0.00, 0, 0.00, 0.25, 0.25, 0.10),
(84, 32, 22, 1.00, 0.25, 0.25, '0', 0.00, 0, 0.00, 0.25, 0.25, 0.10),
(85, 32, 23, 1.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 0.50, 0.50, 0.10),
(86, 32, 24, 1.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 2.00, 2.00, 0.10),
(87, 33, 22, 1.00, 0.25, 0.25, '0', 0.00, 0, 0.00, 0.25, 0.25, 0.10),
(88, 33, 23, 1.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 0.50, 0.50, 0.10),
(89, 34, 22, 1.00, 0.25, 0.25, '0', 0.00, 0, 0.00, 0.25, 0.25, 0.10),
(90, 34, 24, 3.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 6.00, 2.00, 0.10),
(91, 35, 22, 1.00, 0.25, 0.25, '0', 0.00, 0, 0.00, 0.25, 0.25, 0.10),
(92, 35, 23, 2.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 1.00, 0.50, 0.10),
(93, 35, 24, 2.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 4.00, 2.00, 0.10),
(96, 37, 23, 3.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 1.50, 0.50, 0.10),
(97, 38, 23, 9.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 4.50, 0.50, 0.10),
(98, 38, 24, 11.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 22.00, 2.00, 0.10),
(99, 39, 23, 2.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 1.00, 0.50, 0.10),
(100, 39, 24, 4.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 8.00, 2.00, 0.10),
(101, 39, 25, 3.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 3.00, 1.00, 0.30),
(102, 40, 23, 2.00, 0.50, 0.50, '0', 0.00, 0, 0.00, 1.00, 0.50, 0.10),
(103, 40, 24, 4.00, 2.00, 2.00, '0', 0.00, 0, 0.00, 8.00, 2.00, 0.10),
(104, 40, 25, 3.00, 1.00, 1.00, '0', 0.00, 0, 0.00, 3.00, 1.00, 0.30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_sessions`
--

CREATE TABLE IF NOT EXISTS `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('01a9e71c2fea216466e2e47d2092b338b97a26aa', '10.32.0.82', 1496329568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363332393237333b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303037373736223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('215153f3341e5d3f207eec80f3c33efccd91476e', '179.127.205.58', 1460574523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343232333b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('235c5856586b16bd2bdfc858edbe6178e02bc44b', '10.32.0.82', 1496403693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430333633373b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('261a123c785ff44f6a7002b336df2808354227e4', '10.32.0.82', 1496347652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334353637393b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223231223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031353a34393a3438223b),
('2758a7c72a42cf12e3e041735f73801907117b97', '10.32.0.82', 1496411000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431303733303b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936343130323735223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('285cb7ab809e4d2793b9f5766aeb3a0a178dc353', '10.32.0.82', 1496399315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363339393037343b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333339323731223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('2bfaf7ea7882ce4c4e8945a2de60f5045be3e3a6', '::1', 1491239849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233393830353b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('2ef89b12f058d2f1239ec91d9a6a97aed52dcdd6', '::1', 1492014621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323031343537333b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303037353237223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('322a646be557da9fb6354d03018ef7b549d27f90', '10.32.0.82', 1496411074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431313033353b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936343130323735223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('350047199ac9bc0c7c69a7a0ca5a78c3639aa841', '::1', 1491239635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233393432373b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('471fee1fbd28487ebf0873b729c092652e731410', '10.32.0.82', 1496400287, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430303031383b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333339323731223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b6d6573736167657c733a33383a22436f6e666967757261c3a7c3b5657320617475616c697a61646f20636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('4a5834250d882d15a1eccf9b5cc45c6829baa239', '10.32.0.82', 1496414476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431343130303b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936343130383234223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('4e3c7bd946ed24865b84f2c337b086690fd86b2c', '::1', 1492007784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323030373736363b6964656e746974797c733a31333a227573657240757365722e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31333a227573657240757365722e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303037373439223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('53d9a14ec6276fff6d3bd078536a01f2d0a2afaf', '10.32.0.82', 1496411572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431313533313b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936343130323735223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('547ff94ed53b5e9e09478837ce07c78938d605d3', '10.32.0.82', 1496409893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430393839303b),
('5481579c0d0df192e28306a45645c04de2a50da5', '10.32.0.82', 1496410323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431303237353b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936343030333935223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b6d6573736167657c733a39333a223c703e4120696d6167656d2071756520766f63c3aa20657374c3a12074656e74616e646f2066617a65722075706c6f6164206578636564652061732064696d656e73c3b56573206dc3a178696d61207065726d69746964612e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('5a3d6175e3fde5a6f466268f701704884a771394', '10.32.0.82', 1496413675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431333433363b),
('5bbeba852508c7891d49c6db9fed425b86afc6a6', '10.32.0.82', 1496404324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430343236323b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('5e113d1f21bc1ce2d5a866a128644313b7e660eb', '179.127.205.58', 1460574220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537333932313b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('643f20a2749800053da5147c80e5950bbe479594', '10.32.0.82', 1496400453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430303338373b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('6da5006a22102b6e04fe56221e8588844737f848', '179.127.205.58', 1460574838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343534363b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b6d6573736167657c733a32393a2244657370657361204578636c75c3ad646120636f6d207375636573736f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226e6577223b7d),
('6e07e35e236aa27e692ba431e9d5f95e808bc0db', '179.127.205.58', 1460573618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537333536343b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('70d6c85483b6352baa087d6a50f6d32d778720ab', '::1', 1492017353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439323031373330313b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303134353930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b6d6573736167657c733a34323a223c703e4c6f6761646f20636f6d207375636573736f212053656a612042656d2056696e646f213c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('75f624499ae9dba1174046ef8af45a963a9ba70d', '10.32.0.82', 1496341259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334313233393b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b6572726f727c733a37373a224f204361697861206ec3a36f20657374c3a12061626572746f2c20706f72206661766f7220696e666f726d65206f2076616c6f7220646f20636169786120706172612061206162657274757261223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('7a802322c73a161a2012b412d0d4051c47a0209d', '10.32.0.82', 1496408943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430383932393b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('7cb29b98c434f82eee16377a4668398c9a39b8fc', '179.127.205.58', 1460575256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537343939303b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('7f8bbbfd5cb29b46c6057e191886e37d03210d65', '10.32.0.82', 1496329886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363332393538383b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303037373736223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('81e675fdf473629f2cabaa15450c2d6e22ed5366', '179.127.205.58', 1460575927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537353932373b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('8329a922bee47c86cc33235acb9a3d9440b90411', '179.127.205.58', 1460575357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303537353334323b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('86ba01dc88ed3a3ee7719808c3d856710edd70a5', '10.32.0.82', 1496348080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334373738313b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223231223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031353a34393a3438223b6d6573736167657c733a33303a2252656769737472652d7365206665636861646120636f6d20c3aa7869746f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('8918656fe4edf2f26a682605f1455deb7babb091', '10.32.0.82', 1496344939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334333330303b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223231223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031353a34393a3438223b),
('9aa8db3c0cf7422269ea382456de5bdf3a7d6aa7', '10.32.0.82', 1496405434, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430353432313b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('a28d243b8e9362abcd550f959feb5e0e88ef0198', '::1', 1491238872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233383836363b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('a340034d7effbb91e348209176398eddde3eaa83', '::1', 1491235852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233353536323b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a2254686961676f223b6c6173745f6e616d657c733a383a22656d6d616e75656c223b637265617465645f6f6e7c733a33323a22323932392f303330332f323031363136313631362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353639323731223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('a6be490f55f437ec9a4008bf818b11b0f44429bf', '::1', 1491236711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233363436313b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('ac12979160035374b002722f08dda4575f0608d0', '10.32.0.82', 1496398945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363339383732373b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333339323731223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('aef3b3bbbf21ef1353b8c274b420f3feeb9d903e', '10.32.0.82', 1496342913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334323636353b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('b1c9f7b27926c8d01dee1054f2299d24881c7e4e', '10.32.0.82', 1496329102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363332383833373b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343932303137333533223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('b448f2bb917d9eb2111b656992291b0b0e8da3c0', '::1', 1491236395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233363130333b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('b56b6eb897578e1cd5978b6199491997efc8c96e', '10.32.0.82', 1496330100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363332393839313b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239323835223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('ba73cdf690427048819e83d97beaef11fb240d90', '10.32.0.82', 1496398685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363339383430383b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333339323731223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b),
('be726b4c19c7fa9a7fc251ab4fb4c16ed26a0bac', '::1', 1491237359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233373335393b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336303838223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('bf1977e9e1254cfdbe8e5431b44bb90dbdab9db3', '127.0.0.1', 1491238272, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233383236303b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336313336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('c00c4762edd73dd7f982c5c266e4ddd0b16bd205', '127.0.0.1', 1491237622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439313233373531373b6964656e746974797c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365726e616d657c733a393a22617265616e65726478223b656d61696c7c733a32333a22617265616e6572647840617265616e657264782e636f6d223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a393a22617265616e65726478223b6c6173745f6e616d657c733a393a22617265616e65726478223b637265617465645f6f6e7c733a33323a22303330332f303430342f323031373137313731372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343931323336313336223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b),
('c114a686f9eed7caf8a0810f512ace3914c120cd', '179.127.205.58', 1460569304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436303536393236383b6964656e746974797c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365726e616d657c733a363a226a726e657874223b656d61696c7c733a32303a2263616470726f6a65746f73406c6976652e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a363a22496e6163696f223b6c6173745f6e616d657c733a363a224a756e696f72223b637265617465645f6f6e7c733a32323a2232392f30332f323031362031303a35323a313820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343630353533303437223b6c6173745f69707c733a31343a223137392e3132372e3230352e3538223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223131223b636173685f696e5f68616e647c733a363a223130302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031362d30332d32392031313a31383a3234223b),
('c3b41b2ea6e1af32af66bf300a80583da3f94fd7', '10.32.0.82', 1496330346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363333303233383b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239323835223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('c758ccd07c41627b5975510962e3959ffa7d6836', '10.32.0.82', 1496405122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363430343837383b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32323a2231322f30342f323031372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333938343432223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b6d6573736167657c733a38313a223c703e4f207469706f206465206172717569766f2071756520766f63c3aa20657374c3a12074656e74616e646f2066617a65722075706c6f6164206ec3a36f20c3a9207065726d697469646f2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('cdf9870c3ee704c0aaef7766004d55bb082b25c4', '10.32.0.82', 1496414576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431343534363b6964656e746974797c733a32313a226361696f406476696e65737765622e636f6d2e6272223b757365726e616d657c733a31323a224361696f20446176696e6973223b656d61696c7c733a32313a226361696f406476696e65737765622e636f6d2e6272223b757365725f69647c733a313a2238223b66697273745f6e616d657c733a343a224361696f223b6c6173745f6e616d657c733a373a22446176696e6973223b637265617465645f6f6e7c733a32323a2230332f30342f323031372030313a31343a343820504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333238383936223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b72656769737465725f69647c733a323a223139223b636173685f696e5f68616e647c733a353a2231302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30342d30332031333a31363a3335223b6572726f727c733a37303a2241636573736f206e656761646f2120566f63c3aa206ec3a36f2074656d206469726569746f206465206163657373617220612070c3a167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('d0590e024fbb5a99e5b42f679bfc62f86eebe588', '10.32.0.82', 1496340949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334303933373b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('d7580ba329eb59f0b6e83bb6ac81bec88f9b5c45', '10.32.0.82', 1496413875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431333736303b),
('d784b31752890deb18b794134caa3f01ec3b7200', '10.32.0.82', 1496345058, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334353035343b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223231223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031353a34393a3438223b),
('e8ccfaba806f45ef2b2faed98882bbd3b2e68059', '10.32.0.82', 1496343207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334323937333b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223231223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031353a34393a3438223b),
('eceaa53af743767be5755cd518bdec34b190507b', '10.32.0.82', 1496348137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363334383038353b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223232223b636173685f696e5f68616e647c733a343a22302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031373a31353a3337223b6d6573736167657c733a31343a2277656c636f6d6520746f20706f73223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('f0098edee04d773c2167f3c3bf6e798c63cd5c24', '10.32.0.82', 1496339307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363333393236343b6964656e746974797c733a31353a22656d61696c40656d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31353a22656d61696c40656d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a353a2261646d696e223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a33323a22313231322f303430342f323031373137313731372031313a33353a343920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343936333239383937223b6c6173745f69707c733a31303a2231302e33322e302e3832223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b72656769737465725f69647c733a323a223230223b636173685f696e5f68616e647c733a363a223530302e3030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031372d30362d30312031323a30313a3337223b),
('f5f1b0b56a3c37cc1375d14886644049f751a398', '10.32.0.82', 1496413243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313439363431323939383b);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_settings`
--

CREATE TABLE IF NOT EXISTS `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) NOT NULL,
  `footer` varchar(1000) NOT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) NOT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`) VALUES
(1, 'logo1.png', 'DVINESWEB', '(79) 9 9950-6663', 'd/m/Y', 'h:i:s A', 'caio@dvinesweb.com.br', 'portugues', '4.0', 'default', 'Amercia/Belem', 'mail', 'pop.gmail.com', 'geraldopatricio.melo@gmail.com', '', '25', '', 0, 0, NULL, 'R$ ', 1, '0%', 25, 30, '<h2>DVINESWEB - PDV</h2><br>', 'Volte Sempre!\r\n<br>', 3, 0, 1, '0', 1, '', 100, 2, ',', '.', 'F7', 'ALT+F2', 'ALT+F10', 'F3', 'F2', 'F6', 'F4', 'F1', 'Ctrl+F1', 'F5', 'ALT+F7', 0, '', '', '', 42, 0, '1234', 1, 'sk_test_jHf4cEzAYtgcXvgWPCsQAn50', 'pk_test_beat8SWPORb0OVdF2H77A7uG', 'ff2400d9-f3aa-4db5-9dc5-4eee236c6254', 'patriciomelo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_suppliers`
--

CREATE TABLE IF NOT EXISTS `tec_suppliers` (
`id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(2, 'thiago', '03184809307', '', '8899874257', 'thiagoeps@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_suspended_items`
--

CREATE TABLE IF NOT EXISTS `tec_suspended_items` (
`id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,2) NOT NULL,
  `unit_price` decimal(25,2) NOT NULL,
  `net_unit_price` decimal(25,2) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,2) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,2) DEFAULT NULL,
  `subtotal` decimal(25,2) NOT NULL,
  `real_unit_price` decimal(25,2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_suspended_sales`
--

CREATE TABLE IF NOT EXISTS `tec_suspended_sales` (
`id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,2) NOT NULL,
  `product_discount` decimal(25,2) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,2) DEFAULT NULL,
  `total_discount` decimal(25,2) DEFAULT NULL,
  `product_tax` decimal(25,2) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,2) DEFAULT NULL,
  `total_tax` decimal(25,2) DEFAULT NULL,
  `grand_total` decimal(25,2) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,2) DEFAULT NULL,
  `paid` decimal(25,2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_users`
--

CREATE TABLE IF NOT EXISTS `tec_users` (
`id` int(11) unsigned NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) unsigned NOT NULL DEFAULT '2'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`) VALUES
(8, 0x31302e33322e302e3832, 0x3a3a31, 'Caio Davinis', '864522f6d52edb5289bb15aa2d2d1e44a42b4b34', NULL, 'caio@dvinesweb.com.br', NULL, NULL, NULL, NULL, 1491236088, 1496414555, 1, 'Caio', 'Davinis', NULL, '79 9 9950-6663', NULL, 'male', 2),
(9, 0x31302e33322e302e3832, 0x3a3a31, 'admin', '95ecc096fdccf65d803006912d0810c746d755ff', NULL, 'email@email.com', NULL, NULL, NULL, NULL, 1492007749, 1496414100, 1, 'admin', 'admin', NULL, '111111111111', NULL, 'male', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tec_user_logins`
--

CREATE TABLE IF NOT EXISTS `tec_user_logins` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:33:39'),
(2, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 12:53:18'),
(3, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:21'),
(4, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2015-11-02 13:15:30'),
(5, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:20:35'),
(6, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:30:36'),
(7, 1, NULL, 0x3139312e3230372e3135392e313737, 'geraldopatricio.melo@gmail.com', '2015-11-02 22:31:22'),
(8, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2015-11-03 12:34:44'),
(9, 1, NULL, 0x3137372e3134352e352e313135, 'geraldopatricio.melo@gmail.com', '2015-11-11 20:38:46'),
(10, 1, NULL, 0x3230302e3232322e32312e313338, 'geraldopatricio.melo@gmail.com', '2015-11-25 10:45:05'),
(11, 1, NULL, 0x3138372e3131362e3233312e313231, 'geraldopatricio.melo@gmail.com', '2015-12-12 03:37:53'),
(12, 2, NULL, 0x3138372e3131342e39302e3834, 'pdv@pdvparatodos.com.br', '2015-12-12 19:59:25'),
(13, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-16 13:56:15'),
(14, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 16:22:16'),
(15, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-21 19:06:56'),
(16, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 14:44:26'),
(17, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 15:06:16'),
(18, 1, NULL, 0x3138392e38392e3235302e313934, 'geraldopatricio.melo@gmail.com', '2016-01-22 18:29:43'),
(19, 1, NULL, 0x3137372e3137322e31362e323232, 'geraldopatricio.melo@gmail.com', '2016-01-22 22:51:12'),
(20, 1, NULL, 0x3139312e3139352e3235302e3333, 'geraldopatricio.melo@gmail.com', '2016-01-25 23:15:36'),
(21, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:10'),
(22, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:11:52'),
(23, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:37'),
(24, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:49:56'),
(25, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 00:59:18'),
(26, 1, NULL, 0x3137392e3130302e3133362e3737, 'geraldopatricio.melo@gmail.com', '2016-01-26 01:01:39'),
(27, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:12:12'),
(28, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:12:12'),
(29, 1, NULL, 0x3a3a31, 'geraldopatricio.melo@gmail.com', '2016-03-05 15:43:30'),
(30, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-05 15:48:06'),
(31, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-05 22:20:49'),
(32, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-05 23:32:51'),
(33, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-06 06:15:29'),
(34, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-07 21:56:57'),
(35, 2, NULL, 0x3a3a31, 'pdv@pdvparatodos.com.br', '2016-03-08 01:39:04'),
(36, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-08 19:34:35'),
(37, 3, NULL, 0x3a3a31, 'contato@scriptcerto.com.br', '2016-03-09 01:08:22'),
(38, 3, NULL, 0x3136382e39302e38382e3432, 'contato@scriptcerto.com.br', '2016-03-29 13:47:27'),
(39, 4, NULL, 0x3136382e39302e38382e3432, 'jrnext@outlook.com', '2016-03-29 14:18:08'),
(40, 5, NULL, 0x3136382e39302e38382e3432, 'admin@admin.com', '2016-03-29 14:30:35'),
(41, 4, NULL, 0x3138372e34312e3139362e313136, 'jrnext@outlook.com', '2016-03-29 18:22:52'),
(42, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-03-30 02:05:45'),
(43, 4, NULL, 0x3138372e31342e3233372e3638, 'jrnext@outlook.com', '2016-03-30 10:20:10'),
(44, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-03-30 10:31:41'),
(45, 4, NULL, 0x3137372e3138332e3233342e323133, 'jrnext@outlook.com', '2016-03-30 10:55:00'),
(46, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 11:14:20'),
(47, 4, NULL, 0x3137372e3230372e3233372e3533, 'jrnext@outlook.com', '2016-03-30 13:04:31'),
(48, 5, NULL, 0x3138372e36322e3135392e3636, 'admin@admin.com', '2016-03-30 13:09:01'),
(49, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 22:24:31'),
(50, 4, NULL, 0x3137372e35352e3234312e323037, 'jrnext@outlook.com', '2016-03-30 23:10:05'),
(51, 5, NULL, 0x3137392e3132352e35312e323530, 'admin@admin.com', '2016-03-31 00:00:32'),
(52, 5, NULL, 0x3137392e3132352e35312e323530, 'admin@admin.com', '2016-03-31 00:42:32'),
(53, 4, NULL, 0x3136382e39302e38382e3432, 'jrnext@outlook.com', '2016-03-31 14:27:20'),
(54, 5, NULL, 0x3138392e31322e3233392e3539, 'admin@admin.com', '2016-03-31 15:04:56'),
(55, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-03-31 20:09:36'),
(56, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-03-31 20:50:27'),
(57, 5, NULL, 0x3137392e3138332e3137332e3333, 'admin@admin.com', '2016-03-31 23:59:01'),
(58, 4, NULL, 0x3137392e3139372e3232322e313436, 'jrnext@outlook.com', '2016-04-01 00:18:22'),
(59, 5, NULL, 0x3230312e312e37302e3735, 'admin@admin.com', '2016-04-01 01:58:38'),
(60, 6, NULL, 0x3230312e312e37302e3735, 'lojadecriacao@hotmail.com', '2016-04-01 02:01:20'),
(61, 5, NULL, 0x3138372e3132332e3137332e323037, 'admin@admin.com', '2016-04-01 02:06:27'),
(62, 6, NULL, 0x3230312e312e37302e3735, 'lojadecriacao@hotmail.com', '2016-04-01 02:06:55'),
(63, 5, NULL, 0x3230312e312e37302e3735, 'admin@admin.com', '2016-04-01 02:55:29'),
(64, 5, NULL, 0x3138372e34312e3230352e313136, 'admin@admin.com', '2016-04-01 13:49:52'),
(65, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-04-01 16:37:38'),
(66, 4, NULL, 0x3138372e36322e3135392e3636, 'jrnext@outlook.com', '2016-04-01 17:09:28'),
(67, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-01 19:55:27'),
(68, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-02 13:55:13'),
(69, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-04 20:54:14'),
(70, 4, NULL, 0x3137392e3132372e3230302e3138, 'cadprojetos@live.com', '2016-04-07 12:25:54'),
(71, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-10 13:00:50'),
(72, 7, NULL, 0x3130372e3136372e3131322e3732, 'teste@teste.com', '2016-04-10 13:03:28'),
(73, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 13:41:34'),
(74, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:08:40'),
(75, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:20:51'),
(76, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:21:26'),
(77, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:22:02'),
(78, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-10 14:29:48'),
(79, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-11 16:57:18'),
(80, 7, NULL, 0x3137372e3132352e3132302e3432, 'teste@teste.com', '2016-04-12 18:46:02'),
(81, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-12 23:42:19'),
(82, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 01:26:13'),
(83, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 11:28:10'),
(84, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 11:45:36'),
(85, 4, NULL, 0x3138372e36322e3135392e3636, 'cadprojetos@live.com', '2016-04-13 11:51:16'),
(86, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 13:11:01'),
(87, 4, NULL, 0x3137392e3132372e3230352e3538, 'cadprojetos@live.com', '2016-04-13 17:41:11'),
(88, 4, NULL, 0x3a3a31, 'cadprojetos@live.com', '2017-04-03 16:06:40'),
(89, 8, NULL, 0x3a3a31, 'areanerdx@areanerdx.com', '2017-04-03 16:15:36'),
(90, 8, NULL, 0x3132372e302e302e31, 'areanerdx@areanerdx.com', '2017-04-03 16:39:34'),
(91, 8, NULL, 0x3a3a31, 'areanerdx@areanerdx.com', '2017-04-12 14:32:08'),
(92, 9, NULL, 0x3a3a31, 'user@user.com', '2017-04-12 14:36:17'),
(93, 8, NULL, 0x3a3a31, 'areanerdx@areanerdx.com', '2017-04-12 16:29:50'),
(94, 8, NULL, 0x3a3a31, 'areanerdx@areanerdx.com', '2017-04-12 17:15:53'),
(95, 8, NULL, 0x31302e33322e302e3832, 'areanerdx@areanerdx.com', '2017-06-01 14:54:56'),
(96, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-01 15:01:25'),
(97, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-01 15:11:37'),
(98, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-01 17:47:51'),
(99, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-02 10:14:02'),
(100, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-02 10:46:35'),
(101, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-02 13:31:15'),
(102, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-02 13:40:24'),
(103, 9, NULL, 0x31302e33322e302e3832, 'email@email.com', '2017-06-02 14:35:00'),
(104, 8, NULL, 0x31302e33322e302e3832, 'caio@dvinesweb.com.br', '2017-06-02 14:42:35');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tec_categories`
--
ALTER TABLE `tec_categories`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_customers`
--
ALTER TABLE `tec_customers`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_expenses`
--
ALTER TABLE `tec_expenses`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Índices de tabela `tec_groups`
--
ALTER TABLE `tec_groups`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_payments`
--
ALTER TABLE `tec_payments`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_products`
--
ALTER TABLE `tec_products`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `code` (`code`);

--
-- Índices de tabela `tec_purchases`
--
ALTER TABLE `tec_purchases`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_registers`
--
ALTER TABLE `tec_registers`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_sales`
--
ALTER TABLE `tec_sales`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_sessions`
--
ALTER TABLE `tec_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Índices de tabela `tec_settings`
--
ALTER TABLE `tec_settings`
 ADD PRIMARY KEY (`setting_id`);

--
-- Índices de tabela `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
 ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tec_users`
--
ALTER TABLE `tec_users`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`);

--
-- Índices de tabela `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tec_categories`
--
ALTER TABLE `tec_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de tabela `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `tec_customers`
--
ALTER TABLE `tec_customers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de tabela `tec_expenses`
--
ALTER TABLE `tec_expenses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `tec_groups`
--
ALTER TABLE `tec_groups`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de tabela `tec_payments`
--
ALTER TABLE `tec_payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de tabela `tec_products`
--
ALTER TABLE `tec_products`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de tabela `tec_purchases`
--
ALTER TABLE `tec_purchases`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de tabela `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de tabela `tec_registers`
--
ALTER TABLE `tec_registers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de tabela `tec_sales`
--
ALTER TABLE `tec_sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de tabela `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT de tabela `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de tabela `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de tabela `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de tabela `tec_users`
--
ALTER TABLE `tec_users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de tabela `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
