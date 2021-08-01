
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gruposanguineo
-- ----------------------------
DROP TABLE IF EXISTS `gruposanguineo`;
CREATE TABLE `gruposanguineo`  (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idgrupo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gruposanguineo
-- ----------------------------
INSERT INTO `gruposanguineo` VALUES (1, 'O RH+');
INSERT INTO `gruposanguineo` VALUES (2, 'O RH-');
INSERT INTO `gruposanguineo` VALUES (3, 'A RH+');
INSERT INTO `gruposanguineo` VALUES (4, 'A RH-');

-- ----------------------------
-- Table structure for localidades
-- ----------------------------
DROP TABLE IF EXISTS `localidades`;
CREATE TABLE `localidades`  (
  `idlocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `idprovincia` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idlocalidad`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for nacionalidades
-- ----------------------------
DROP TABLE IF EXISTS `nacionalidades`;
CREATE TABLE `nacionalidades`  (
  `idnacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nacionalidad` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idnacionalidad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nacionalidades
-- ----------------------------
INSERT INTO `nacionalidades` VALUES (1, 'ARGENTINA');
INSERT INTO `nacionalidades` VALUES (2, 'BRASILEÑA');
INSERT INTO `nacionalidades` VALUES (3, 'PARAGUAYA');
INSERT INTO `nacionalidades` VALUES (4, 'URUGUAYA');
INSERT INTO `nacionalidades` VALUES (5, 'MEXICANA');
INSERT INTO `nacionalidades` VALUES (6, 'BOLIVIANA');
INSERT INTO `nacionalidades` VALUES (7, 'VENEZOLANA');

-- ----------------------------
-- Table structure for provincias
-- ----------------------------
DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias`  (
  `idprovincia` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `pais` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idprovincia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for socios
-- ----------------------------
DROP TABLE IF EXISTS `socios`;
CREATE TABLE `socios`  (
  `IDSOCIO` int(11) NOT NULL AUTO_INCREMENT,
  `APELLIDOS` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOMBRES` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FECHANAC` date NULL DEFAULT NULL,
  `DIRECCION` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDLOCALIDAD` int(11) NULL DEFAULT NULL,
  `CELULAR` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TELEFONO` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CUIT` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CBU` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CTABCO` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DNI` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FECHAINGRESO` date NULL DEFAULT NULL,
  `IDNAC` int(11) NULL DEFAULT NULL,
  `TIPODOC` int(11) NULL DEFAULT NULL,
  `IDGRUPO` int(11) NULL DEFAULT NULL,
  `IDESTADOCIVIL` int(11) NULL DEFAULT NULL,
  `IDPROFESION` int(11) NULL DEFAULT NULL,
  `CONYUGE` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACTIVO` int(11) NULL DEFAULT NULL,
  `NUMEROSOCIO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`IDSOCIO`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of socios
-- ----------------------------
INSERT INTO `socios` VALUES (1, 'STECKLER', 'DANIEL OSCAR', NULL, 'CASA 15', 1, NULL, NULL, '20278458904', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '27845');
INSERT INTO `socios` VALUES (2, 'STECKLER', 'DAIRA BELEN', NULL, 'casa 15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '84580');
INSERT INTO `socios` VALUES (3, 'PEREZ', 'JORGE', NULL, 'S/N', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23254');
INSERT INTO `socios` VALUES (4, 'PEREZ', 'ARIEL', NULL, 'S/N', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30377');
INSERT INTO `socios` VALUES (5, 'WENTZ', 'MARIO', NULL, 'LAS ROSAS 22', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '52412');
INSERT INTO `socios` VALUES (6, 'WENTZ', 'HUGO', NULL, 'LAPACHO 125', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '65823');
INSERT INTO `socios` VALUES (7, 'FRUTOS', 'CLAUDIA', NULL, 'casa 15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '56842');
INSERT INTO `socios` VALUES (8, 'FRUTOS', 'LUIS', NULL, 'CALLE 15', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23541');
INSERT INTO `socios` VALUES (9, 'ANDERSON', 'PEDRO', NULL, 'RUTA 14 KM 21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '39567');
INSERT INTO `socios` VALUES (10, 'STEVENSON', 'PEDRO', NULL, 'RUTA 14 KM 21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '35456');
INSERT INTO `socios` VALUES (11, 'ARIES', 'JUAN', NULL, 'RUTA 14 KM 21', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20564');

-- ----------------------------
-- Table structure for tipodoc
-- ----------------------------
DROP TABLE IF EXISTS `tipodoc`;
CREATE TABLE `tipodoc`  (
  `idtipodoc` int(11) NOT NULL AUTO_INCREMENT,
  `documento` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtipodoc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipodoc
-- ----------------------------
INSERT INTO `tipodoc` VALUES (1, 'DNI');
INSERT INTO `tipodoc` VALUES (2, 'LIBRETA CIVICA');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`  (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nombres` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `acceso` int(11) NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idusuario`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES (1, 'DANIEL', 'Daniel Steckler', 3, 'pepe');

SET FOREIGN_KEY_CHECKS = 1;
