-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2017 年 12 月 20 日 00:17
-- 服务器版本: 5.5.32
-- PHP 版本: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jxcms_bd`
--
CREATE DATABASE IF NOT EXISTS `jxcms_bd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jxcms_bd`;

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `desc`) VALUES
(1, '皮衣革', '用途：皮衣'),
(2, '鞋皮革', '用途：皮鞋'),
(3, '箱皮革', '用途：行礼箱皮草'),
(4, '包皮革', '用途：包包皮革'),
(15, '饰品皮革', '用途：饰品皮革');

-- --------------------------------------------------------

--
-- 表的结构 `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id_card` varchar(50) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1表示普通员工，0表示管理员',
  `status` int(11) NOT NULL DEFAULT '1',
  `stock_house_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_house_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `employee`
--

INSERT INTO `employee` (`id`, `name`, `phone`, `address`, `username`, `password`, `id_card`, `type`, `status`, `stock_house_id`) VALUES
(1, '老板', NULL, NULL, 'admin', '123456', NULL, 0, 1, NULL),
(2, '销售员小王', '13345678906', '江苏南京', 'wang', '123456', '365555659599049990', 1, 1, NULL),
(3, '销售员小李', '13322332233', '江西九江', 'xiaoli', '123456', '356735454555566664', 1, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `spec` varchar(20) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1096 ;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `spec`, `unit`, `price`, `category_id`) VALUES
(1078, '13元饰品皮革', 'EE0002', '米', '13.00', 15),
(1079, '11元饰品皮革', 'EE0001', '米', '11.00', 15),
(1080, '14元皮包革', 'NN0004', '米', '14.00', 4),
(1081, '13元皮包革', 'NN0003', '米', '13.00', 4),
(1082, '12元皮包革', 'NN0002', '米', '12.00', 4),
(1083, '11元皮包革', 'NN0001', '米', '11.00', 4),
(1084, '14元箱皮革', 'SN0004', '米', '14.00', 3),
(1085, '13元箱皮革', 'SN0003', '米', '13.00', 3),
(1086, '12元箱皮革', 'SN0002', '米', '12.00', 3),
(1087, '11元箱皮革', 'SN0001', '米', '11.00', 3),
(1088, '14元鞋皮革', 'NS0004', '米', '14.00', 2),
(1089, '13元鞋皮革', 'NS0003', '米', '13.00', 2),
(1090, '12元鞋皮革', 'NS0002', '米', '12.00', 2),
(1091, '11元鞋皮革', 'NS0001', '米', '11.00', 2),
(1092, '14元皮衣革', 'NO0004', '米', '14.00', 1),
(1093, '13元皮衣革', 'NO0003', '米', '13.00', 1),
(1094, '12元皮衣革', 'NO0002', '米', '12.00', 1),
(1095, '11元皮衣革', 'NO0001', '米', '11.00', 1);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `product_view`
--
CREATE TABLE IF NOT EXISTS `product_view` (
`id` bigint(20)
,`name` varchar(50)
,`spec` varchar(20)
,`unit` varchar(20)
,`price` decimal(10,2)
,`category_id` int(11)
,`category_name` varchar(20)
);
-- --------------------------------------------------------

--
-- 表的结构 `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `purchase_date` datetime NOT NULL,
  `stock_house_id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总价格（成本）',
  PRIMARY KEY (`id`),
  KEY `stock_house_id` (`stock_house_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `purchase`
--

INSERT INTO `purchase` (`id`, `employee_id`, `purchase_date`, `stock_house_id`, `price`) VALUES
(12, 1, '2017-12-17 00:11:41', 3, '31108.00'),
(13, 1, '2017-12-17 00:14:55', 2, '8092.00'),
(14, 1, '2017-12-17 01:07:51', 2, '73333326.00'),
(15, 1, '2017-12-17 01:08:30', 2, '99999999.99'),
(16, 1, '2017-12-17 01:09:39', 3, '99999999.99'),
(17, 1, '2017-12-17 01:10:36', 3, '99999999.99');

-- --------------------------------------------------------

--
-- 表的结构 `purchase_item`
--

CREATE TABLE IF NOT EXISTS `purchase_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '入库单号',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `quantity` double(10,2) NOT NULL COMMENT '数量',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enter_stock_id` (`purchase_id`),
  KEY `product_id` (`product_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `purchase_item`
--

INSERT INTO `purchase_item` (`id`, `purchase_id`, `product_id`, `quantity`, `unit_price`, `employee_id`) VALUES
(18, 12, 1084, 2222.00, '14.00', 1),
(19, 13, 1095, 222.00, '10.00', 1),
(20, 13, 1081, 222.00, '10.00', 1),
(21, 13, 1085, 332.00, '11.00', 1),
(22, 14, 1081, 2222222.00, '11.00', 1),
(23, 14, 1088, 4444444.00, '11.00', 1),
(24, 15, 1083, 99999999.99, '9.00', 1),
(25, 16, 1085, 99999999.99, '9.00', 1),
(26, 16, 1081, 99999999.99, '9.00', 1),
(27, 17, 1095, 99999999.99, '11.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sale`
--

CREATE TABLE IF NOT EXISTS `sale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `sale_date` datetime NOT NULL,
  `stock_house_id` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总价格（成本）',
  PRIMARY KEY (`id`),
  KEY `stock_house_id` (`stock_house_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `sale`
--

INSERT INTO `sale` (`id`, `employee_id`, `sale_date`, `stock_house_id`, `price`) VALUES
(7, 1, '2017-12-17 00:16:22', 3, '36663.00'),
(8, 1, '2017-12-17 00:17:24', 2, '6021.00');

-- --------------------------------------------------------

--
-- 表的结构 `sale_item`
--

CREATE TABLE IF NOT EXISTS `sale_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) DEFAULT NULL COMMENT '销售单号',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `quantity` double(10,2) NOT NULL COMMENT '数量',
  `unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `sale_item`
--

INSERT INTO `sale_item` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `employee_id`) VALUES
(9, 7, 1095, 1111.00, '11.00', 1),
(10, 7, 1085, 1111.00, '11.00', 1),
(11, 7, 1081, 1111.00, '11.00', 1),
(12, 8, 1081, 223.00, '9.00', 1),
(13, 8, 1083, 223.00, '9.00', 1),
(14, 8, 1088, 223.00, '9.00', 1);

-- --------------------------------------------------------

--
-- 表的结构 `stock_house`
--

CREATE TABLE IF NOT EXISTS `stock_house` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `stock_house`
--

INSERT INTO `stock_house` (`id`, `name`, `address`) VALUES
(1, '义乌仓库3', '义乌市场三楼'),
(2, '义乌仓库2', '义乌市场二楼'),
(3, '义乌仓库1', '义乌市场一楼');

-- --------------------------------------------------------

--
-- 表的结构 `stock_pile`
--

CREATE TABLE IF NOT EXISTS `stock_pile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock_house_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` double(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_house_id` (`stock_house_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `stock_pile`
--

INSERT INTO `stock_pile` (`id`, `stock_house_id`, `product_id`, `quantity`) VALUES
(16, 1, 1095, 11111.00),
(17, 1, 1094, 33333.00),
(18, 1, 1093, 3334.00),
(19, 1, 1092, 22222.00),
(20, 1, 1091, 4444.00),
(21, 1, 1090, 2222.00),
(22, 1, 1089, 44444.00),
(23, 1, 1088, 1111.00),
(24, 1, 1087, 111.00),
(25, 1, 1086, 444.00),
(26, 1, 1085, 44433.00),
(27, 1, 1084, 555.00),
(28, 1, 1083, 444.00),
(29, 1, 1082, 7777.00),
(30, 1, 1081, 7777.00),
(31, 1, 1080, 888.00),
(32, 1, 1079, 666.00),
(33, 1, 1078, 8888.00),
(34, 2, 1082, 333.00),
(35, 3, 1084, 7777.00),
(36, 2, 1095, 222.00),
(37, 2, 1081, 2222221.00),
(38, 2, 1085, 332.00),
(39, 3, 1095, 99998888.99),
(40, 3, 1085, 99998888.99),
(41, 3, 1081, 99998888.99),
(42, 2, 1083, 99999776.99),
(43, 2, 1088, 4444221.00);

-- --------------------------------------------------------

--
-- 视图结构 `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_view` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`spec` AS `spec`,`p`.`unit` AS `unit`,`p`.`price` AS `price`,`p`.`category_id` AS `category_id`,`c`.`name` AS `category_name` from (`product` `p` left join `category` `c` on((`c`.`id` = `p`.`category_id`)));

--
-- 限制导出的表
--

--
-- 限制表 `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`stock_house_id`) REFERENCES `stock_house` (`id`);

--
-- 限制表 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- 限制表 `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`stock_house_id`) REFERENCES `stock_house` (`id`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- 限制表 `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `purchase_item_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  ADD CONSTRAINT `purchase_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `purchase_item_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- 限制表 `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`stock_house_id`) REFERENCES `stock_house` (`id`),
  ADD CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- 限制表 `sale_item`
--
ALTER TABLE `sale_item`
  ADD CONSTRAINT `sale_item_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sale` (`id`),
  ADD CONSTRAINT `sale_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `sale_item_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- 限制表 `stock_pile`
--
ALTER TABLE `stock_pile`
  ADD CONSTRAINT `stock_pile_ibfk_1` FOREIGN KEY (`stock_house_id`) REFERENCES `stock_house` (`id`),
  ADD CONSTRAINT `stock_pile_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
