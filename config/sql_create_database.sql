/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `sistema_de_vendas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_de_vendas`;

CREATE TABLE IF NOT EXISTS `tb_carrinhos` (
  `id_carrinho` int NOT NULL AUTO_INCREMENT,
  `id_venda` int NOT NULL,
  `id_produto` int NOT NULL,
  `valor_produto` double(22,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_carrinho`),
  KEY `Coluna 2` (`id_venda`),
  KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Herda PK de tb_vendas para vincular produtos da venda realizada';

DELETE FROM `tb_carrinhos`;
/*!40000 ALTER TABLE `tb_carrinhos` DISABLE KEYS */;
INSERT INTO `tb_carrinhos` (`id_carrinho`, `id_venda`, `id_produto`, `valor_produto`) VALUES
	(1, 1, 15, 94.86),
	(2, 1, 14, 1.52),
	(3, 2, 15, 94.86),
	(4, 2, 14, 1.52),
	(5, 3, 85, 22.68),
	(6, 3, 19, 62.15),
	(7, 3, 84, 57.59);
/*!40000 ALTER TABLE `tb_carrinhos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_entregas` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(10) NOT NULL DEFAULT '',
  `endereco` varchar(50) NOT NULL DEFAULT '' COMMENT 'Logradouro',
  `numero` varchar(10) NOT NULL DEFAULT '',
  `bairro` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `cidade` varchar(30) NOT NULL DEFAULT '',
  `uf` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabela para endereços de entrega';

DELETE FROM `tb_entregas`;
/*!40000 ALTER TABLE `tb_entregas` DISABLE KEYS */;
INSERT INTO `tb_entregas` (`id_entrega`, `cep`, `endereco`, `numero`, `bairro`, `cidade`, `uf`) VALUES
	(1, '03609-000', 'Rua Maria Teresa Assunção', '5', 'Vila São Geraldo', 'São Paulo', 'SP'),
	(2, '03609-000', 'Rua Maria Teresa Assunção', '5', 'Vila São Geraldo', 'São Paulo', 'SP'),
	(3, '03604-000', 'Rua Padre Benedito de Camargo', '5', 'Penha de França', 'São Paulo', 'SP');
/*!40000 ALTER TABLE `tb_entregas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `produto` varchar(30) NOT NULL DEFAULT 'Default',
  `codigo_barras` bigint DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `valor` double(22,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `tb_produtos`;
/*!40000 ALTER TABLE `tb_produtos` DISABLE KEYS */;
INSERT INTO `tb_produtos` (`id_produto`, `produto`, `codigo_barras`, `descricao`, `valor`) VALUES
	(1, 'Flower - Commercial Bronze', 6963539572064, NULL, 59.06),
	(2, 'Mushroom Morel Fresh', 4136558457119, NULL, 4.42),
	(3, 'Cake - Bande Of Fruit', 2353840238233, NULL, 28.60),
	(4, 'Sauce Bbq Smokey', 4858499648622, NULL, 89.48),
	(5, 'Venison - Liver', 9245723896125, NULL, 64.70),
	(6, 'Sage - Ground', 9455493215868, NULL, 34.37),
	(7, 'Gatorade - Orange', 4454849364745, NULL, 11.30),
	(8, 'Pepper - Orange', 6194320920176, NULL, 73.94),
	(9, 'The Pop Shoppe - Cream Soda', 5119374465646, NULL, 58.24),
	(10, 'Cleaner - Bleach', 5536822910783, NULL, 46.24),
	(11, 'Rum - Spiced, Captain Morgan', 8003797960130, NULL, 68.69),
	(12, 'Sugar Thermometer', 4399394511322, NULL, 39.37),
	(13, 'Bread - Triangle White', 9344029363205, NULL, 22.72),
	(14, 'Baking Soda', 5097774948165, NULL, 1.52),
	(15, 'Aspic - Light', 3999695002376, NULL, 94.86),
	(16, 'Bread - Raisin', 1032215055381, NULL, 23.97),
	(17, 'Ham - Black Forest', 6629043303865, NULL, 53.50),
	(18, 'Duck - Fat', 6373329939762, NULL, 97.06),
	(19, 'Cake - Mini Cheesecake', 3653751610202, NULL, 62.15),
	(20, 'Cake Sheet Combo Party Pack', 3730498147310, NULL, 67.75),
	(21, 'Broccoli - Fresh', 8160454685133, NULL, 67.68),
	(22, 'Beef - Tongue, Fresh', 5616923380606, NULL, 62.76),
	(23, 'Squash - Pepper', 3021296051597, NULL, 43.91),
	(24, 'Chinese Foods - Cantonese', 5615576242889, NULL, 49.56),
	(25, 'Dried Apple', 3442649260513, NULL, 11.00),
	(26, 'Soup Campbells Beef With Veg', 4304901708504, NULL, 76.30),
	(27, 'Rice - Long Grain', 6274935433312, NULL, 29.57),
	(28, 'Snapple - Mango Maddness', 6595153484949, NULL, 93.27),
	(29, 'Steampan Lid', 2531768472909, NULL, 11.94),
	(30, 'Extract - Almond', 6266964498327, NULL, 2.75),
	(31, 'Cake - French Pear Tart', 3911670186573, NULL, 44.30),
	(32, 'Pernod', 7721625347327, NULL, 82.30),
	(33, 'Soup - Cream Of Broccoli', 2047445470449, NULL, 94.73),
	(34, 'Chickhen - Chicken Phyllo', 3003314781731, NULL, 6.03),
	(35, 'Container Clear 8 Oz', 9048163315636, NULL, 59.53),
	(36, 'Sauce - Soya, Dark', 1086977699316, NULL, 4.37),
	(37, 'Veal - Striploin', 2977037802518, NULL, 90.20),
	(38, 'Wood Chips - Regular', 5873328565715, NULL, 99.52),
	(39, 'Pork - Ham Hocks - Smoked', 8426294427118, NULL, 41.61),
	(40, 'Fish - Halibut, Cold Smoked', 2553594205168, NULL, 39.08),
	(41, 'Milk - Condensed', 1986376583871, NULL, 53.92),
	(42, 'Lettuce - Escarole', 6196290274034, NULL, 48.19),
	(43, 'Vaccum Bag - 14x20', 5058094983972, NULL, 95.73),
	(44, 'Wine - Trimbach Pinot Blanc', 8733828787107, NULL, 60.72),
	(45, 'Ecolab - Mikroklene 4/4 L', 4182866784121, NULL, 3.36),
	(46, 'Otomegusa Dashi Konbu', 5872854563173, NULL, 38.18),
	(47, 'Cookies - Englishbay Chochip', 1253020700737, NULL, 15.28),
	(48, 'Tart - Raisin And Pecan', 3858856718546, NULL, 54.53),
	(49, 'Shrimp - 31/40', 7812740339701, NULL, 81.56),
	(50, 'Swiss Chard', 6918182427490, NULL, 7.40),
	(51, 'Oil - Peanut', 3063296255673, NULL, 72.20),
	(52, 'Bread - Rolls, Rye', 6732298277260, NULL, 63.18),
	(53, 'Flour - Fast / Rapid', 4518966799009, NULL, 53.25),
	(54, 'Soup - French Can Pea', 5193556186036, NULL, 39.48),
	(55, 'Veal - Brisket, Provimi,bnls', 3391220563934, NULL, 16.55),
	(56, 'Crab - Blue, Frozen', 9076159292671, NULL, 91.09),
	(57, 'Fish - Bones', 2762955308151, NULL, 74.51),
	(58, 'Buffalo - Short Rib Fresh', 5124360255588, NULL, 12.78),
	(59, 'Silicone Parch. 16.3x24.3', 9428055329886, NULL, 63.72),
	(60, 'Galliano', 3492901392677, NULL, 16.76),
	(61, 'Parsley - Dried', 3679679464089, NULL, 8.95),
	(62, 'Cookie Dough - Oatmeal Rasin', 3957337795020, NULL, 71.30),
	(63, 'Wine - German Riesling', 3039735968240, NULL, 85.95),
	(64, 'Beer - Fruli', 2034469221699, NULL, 89.84),
	(65, 'Lamb - Leg, Boneless', 1636882687224, NULL, 93.14),
	(66, 'Carrots - Purple, Organic', 4856695824499, NULL, 12.83),
	(67, 'Saskatoon Berries - Frozen', 4951994345972, NULL, 98.97),
	(68, 'Chestnuts - Whole,canned', 4876274361270, NULL, 4.56),
	(69, 'Sauce - Balsamic Viniagrette', 6928807834341, NULL, 62.04),
	(70, 'Salmon - Fillets', 6219316974020, NULL, 70.63),
	(71, 'Mop Head - Cotton, 24 Oz', 8444186020425, NULL, 98.33),
	(72, 'Oil - Olive Bertolli', 7700665758094, NULL, 30.63),
	(73, 'Chicken - Bones', 4665764579031, NULL, 4.56),
	(74, 'Corn Syrup', 7037516252177, NULL, 11.11),
	(75, 'Cassis', 1371753940138, NULL, 91.09),
	(76, 'Beer - Corona', 7404839789724, NULL, 51.75),
	(77, 'Baking Powder', 3663112340976, NULL, 65.43),
	(78, 'Red Snapper - Fillet, Skin On', 7431939130446, NULL, 22.82),
	(79, 'Pepper - White, Ground', 5748408824227, NULL, 98.65),
	(80, 'Lettuce - Romaine', 9773507327323, NULL, 9.10),
	(81, 'Muffin Mix - Morning Glory', 9856405500132, NULL, 17.00),
	(82, 'Spinach - Frozen', 9657621244793, NULL, 77.38),
	(83, 'Salt And Pepper Mix - Black', 8332962497772, NULL, 60.36),
	(84, 'Beans - Black Bean, Dry', 5058693462404, NULL, 57.59),
	(85, 'Beef - Short Ribs', 1365339601849, NULL, 22.68),
	(86, 'Tea Peppermint', 3593521614639, NULL, 43.35),
	(87, 'Crab - Imitation Flakes', 6625134008093, NULL, 99.25),
	(88, 'Cocoa Feuilletine', 5948836692562, NULL, 45.70),
	(89, 'Mint - Fresh', 6728823653747, NULL, 69.99),
	(90, 'Juice - Orange, 341 Ml', 6949302090305, NULL, 51.50),
	(91, 'French Pastry - Mini Chocolate', 6406447389133, NULL, 17.82),
	(92, 'Beans - Fava Fresh', 2447531341866, NULL, 21.59),
	(93, 'Beets - Golden', 4131831715906, NULL, 38.54);
/*!40000 ALTER TABLE `tb_produtos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `tb_vendas` (
  `id_venda` int NOT NULL AUTO_INCREMENT,
  `id_entrega` int NOT NULL,
  `data_venda` date DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_entrega` (`id_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `tb_vendas`;
/*!40000 ALTER TABLE `tb_vendas` DISABLE KEYS */;
INSERT INTO `tb_vendas` (`id_venda`, `id_entrega`, `data_venda`) VALUES
	(1, 1, '2020-12-09'),
	(2, 2, '2020-12-09'),
	(3, 3, '2020-12-16');
/*!40000 ALTER TABLE `tb_vendas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
