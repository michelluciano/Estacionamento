-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.21 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para estacionamento
CREATE DATABASE IF NOT EXISTS `estacionamento` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estacionamento`;

-- Copiando estrutura para tabela estacionamento.forma_de_pagamento
CREATE TABLE IF NOT EXISTS `forma_de_pagamento` (
  `idformadepagamento` bigint NOT NULL AUTO_INCREMENT,
  `fpdescricao` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idformadepagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.forma_de_pagamento: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `forma_de_pagamento` DISABLE KEYS */;
INSERT IGNORE INTO `forma_de_pagamento` (`idformadepagamento`, `fpdescricao`, `status`) VALUES
	(1, 'Dinheiro', 'ATIVA'),
	(2, 'Cartão de Débito', 'ATIVA'),
	(3, 'Cartão de Crédito', 'ATIVA');
/*!40000 ALTER TABLE `forma_de_pagamento` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.perfil: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT IGNORE INTO `perfil` (`id`, `nome`) VALUES
	(1, 'ROLE_ADMINISTRADOR'),
	(2, 'ROLE_FUNCIONARIO');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.tb_categoria
CREATE TABLE IF NOT EXISTS `tb_categoria` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `valorhora` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.tb_categoria: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT IGNORE INTO `tb_categoria` (`idcategoria`, `descricao`, `status`, `valorhora`) VALUES
	(1, 'Motocicleta', 'ATIVA', 2.00),
	(2, 'Utilitário', 'ATIVA', 5.00),
	(3, 'Camionete', 'ATIVA', 7.00),
	(4, 'Caminhão', 'INATIVA', 7.00);
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.ticket
CREATE TABLE IF NOT EXISTS `ticket` (
  `id_ticket` bigint NOT NULL AUTO_INCREMENT,
  `ticket_status` varchar(255) DEFAULT NULL,
  `ticket_tempo_decorrido` time DEFAULT NULL,
  `ticket_valor_total` decimal(19,2) DEFAULT NULL,
  `ticketdt_entrada` datetime(6) DEFAULT NULL,
  `ticketdt_saida` datetime(6) DEFAULT NULL,
  `fk_idformapagamento` bigint DEFAULT NULL,
  `fk_idusuario` bigint DEFAULT NULL,
  `fk_idveiculo` bigint DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `FKn9bd30sk99u2jkkdmn09x3xbm` (`fk_idformapagamento`),
  KEY `FK333tcda4iu1ge6as7h4wbmfw7` (`fk_idusuario`),
  KEY `FKjflvu7m7hrhscomgqucr4uxow` (`fk_idveiculo`),
  CONSTRAINT `FK333tcda4iu1ge6as7h4wbmfw7` FOREIGN KEY (`fk_idusuario`) REFERENCES `usuario` (`idusario`),
  CONSTRAINT `FKjflvu7m7hrhscomgqucr4uxow` FOREIGN KEY (`fk_idveiculo`) REFERENCES `veiculo` (`idveiculo`),
  CONSTRAINT `FKn9bd30sk99u2jkkdmn09x3xbm` FOREIGN KEY (`fk_idformapagamento`) REFERENCES `forma_de_pagamento` (`idformadepagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.ticket: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT IGNORE INTO `ticket` (`id_ticket`, `ticket_status`, `ticket_tempo_decorrido`, `ticket_valor_total`, `ticketdt_entrada`, `ticketdt_saida`, `fk_idformapagamento`, `fk_idusuario`, `fk_idveiculo`) VALUES
	(1, 'EM_ABERTO', NULL, 0.00, '2020-11-09 01:17:02.987798', NULL, 1, 2, 2),
	(2, 'EM_ABERTO', NULL, 0.00, '2020-11-09 01:17:02.987798', NULL, 2, 1, 1),
	(3, 'PAGO', NULL, 0.00, '2020-11-09 01:17:02.987798', NULL, 3, 1, 3);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusario` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `usuario_nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idusario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`idusario`, `email`, `senha`, `usuario_nome`) VALUES
	(1, 'admin@email.com', '$2a$10$ypdR89O4lSg7FW.Rc/ciS.dpeNVEE8RFZcaJBVQTJYAF2wHYqHl/G', 'Joana da Silva'),
	(2, 'funcionario@email.com', '$2a$10$ypdR89O4lSg7FW.Rc/ciS.dpeNVEE8RFZcaJBVQTJYAF2wHYqHl/G', 'Joao dos Santos');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.usuario_perfis
CREATE TABLE IF NOT EXISTS `usuario_perfis` (
  `usuario_idusario` bigint NOT NULL,
  `perfis_id` bigint NOT NULL,
  KEY `FK7bhs80brgvo80vhme3u8m6ive` (`perfis_id`),
  KEY `FKise252fu8l0xx1b90w79j34m0` (`usuario_idusario`),
  CONSTRAINT `FK7bhs80brgvo80vhme3u8m6ive` FOREIGN KEY (`perfis_id`) REFERENCES `perfil` (`id`),
  CONSTRAINT `FKise252fu8l0xx1b90w79j34m0` FOREIGN KEY (`usuario_idusario`) REFERENCES `usuario` (`idusario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.usuario_perfis: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_perfis` DISABLE KEYS */;
INSERT IGNORE INTO `usuario_perfis` (`usuario_idusario`, `perfis_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `usuario_perfis` ENABLE KEYS */;

-- Copiando estrutura para tabela estacionamento.veiculo
CREATE TABLE IF NOT EXISTS `veiculo` (
  `idveiculo` bigint NOT NULL AUTO_INCREMENT,
  `corveiculo` varchar(255) DEFAULT NULL,
  `marcaveiculo` varchar(255) DEFAULT NULL,
  `modeloveiculo` varchar(255) DEFAULT NULL,
  `placaveiculo` varchar(255) DEFAULT NULL,
  `fk_idcategoria` bigint DEFAULT NULL,
  PRIMARY KEY (`idveiculo`),
  KEY `FKc5wqaue1veoks39mo8tp6f4t3` (`fk_idcategoria`),
  CONSTRAINT `FKc5wqaue1veoks39mo8tp6f4t3` FOREIGN KEY (`fk_idcategoria`) REFERENCES `tb_categoria` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela estacionamento.veiculo: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT IGNORE INTO `veiculo` (`idveiculo`, `corveiculo`, `marcaveiculo`, `modeloveiculo`, `placaveiculo`, `fk_idcategoria`) VALUES
	(1, 'Branco', 'FIAT', 'UNO', 'IMP-8126', 2),
	(2, 'Prata', 'HONDA', 'FIT', 'PIM-4578', 2),
	(3, 'AZUL', 'HONDA', 'CG-125', 'KPK-6754', 1),
	(4, 'VERMELHA', 'FORD', 'RANGER', 'KPK-6754', 3),
	(5, 'BRANCA', 'VOLKSWAGEN', 'SAVEIRO', 'IOP-4546', 3),
	(6, 'PRETO', 'CHEVROLET', 'MONTANA', 'AAA-1245', 3),
	(7, 'PRATO', 'VOLKSWAGEN', 'POLO', 'BCD-4578', 2);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
