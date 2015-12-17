-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.17 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.5027
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para iparsex
CREATE DATABASE IF NOT EXISTS `iparsex` /*!40100 DEFAULT CHARACTER SET utf16 */;
USE `iparsex`;


-- Volcando estructura para tabla iparsex.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'identificador',
  `pass` varchar(250) NOT NULL DEFAULT '0' COMMENT 'password del usuario',
  `nombre` varchar(200) NOT NULL DEFAULT 'ANONIMO' COMMENT 'nombre persona',
  `dni` varchar(9) DEFAULT 'ANONIMO' COMMENT 'dni persona, no es un nif',
  `fecha_nacimiento` date DEFAULT NULL COMMENT 'fecha nacimiento',
  `observaciones` text COMMENT 'observaciones',
  `email` varchar(250) DEFAULT NULL COMMENT 'email del correo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COMMENT='Tabla para representar una persona fisica';

-- Volcando datos para la tabla iparsex.persona: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`id`, `pass`, `nombre`, `dni`, `fecha_nacimiento`, `observaciones`, `email`) VALUES
	(1, '123456', 'Pepe Biñuela Ajúiz', '45567839H', '1984-12-16', 'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T', 'pepe.biñuela@gmail.com'),
	(2, '123456', 'Sabrina Debora Salerno', '23456789J', '1969-12-18', 'Sus comienzos fueron como modelo y en televisión. De ahí en 1986, de la mano de un DJ, empezó su carrera musical con el éxito Sexy girl que solo tuvo una buena acogida en países de Europa, pero su éxito internacional más importante fue en 1987 con la canción Boys, con la que llega a ser conocida también en Sudamérica y Asia.\r\n\r\nEn España, donde saltó a la fama tras su actuación en 1987 en el programa Un, dos, tres... responda otra vez, causó un tremendo escándalo de proporción nacional cuando durante la gala de Nochevieja del mismo año de TVE, uno de los pechos de Sabrina se salió del escote en directo, momento que fue visto y comentado durante semanas por millones de espectadores. Más adelante se ha sabido que dicha actuación había sido grabada varias semanas antes y que el responsable de la grabación, Hugo Stuven, engañó al manager de Sabrina diciendo que dichas tomas no aparecerían en el montaje final.\r\n\r\nYa con mayor presupuesto, el sencillo "All of Me" en 1989 tiene una buena acogida y se ubica en buenos puestos. "All of Me" contó con una ambiciosa producción de Stock, Aitken y Waterman, los más aclamados productores de finales de los años 80, que habían lanzado a Kylie Minogue, Rick Astley y habían contribuido al relanzamiento de Donna Summer y el grupo Bananarama.\r\n\r\nSabrina posó desnuda para varias revistas, y en programas de TV captó la atención por sus sensuales movimientos. En el canal español TVE provocó el ya referido escándalo al salirse un seno de su vestuario en el especial de fin de año de 1987, un anticipo del caso de Janet Jackson.1 Aunque este suceso relanzó el éxito de "Boys (Summertime Love)", realmente Sabrina estaba interpretando su siguiente sencillo ("Hot Girl") cuando ocurrió.', 'sabrina@tetasgordas.com'),
	(3, '123456', 'Sabrina Fox', 'ANONIMO', '1966-05-15', 'Su despegue como personaje popular se debió a fotografías de semidesnudo (topless) en la prensa británica. Consiguió luego diversos éxitos musicales en el género dance pop bajo la producción del trío Stock Aitken Waterman, coincidiendo con otros ídolos juveniles como Kylie Minogue, Sabrina Salerno, Rick Astley, Sinitta y Jason Donovan. Entre sus canciones más exitosas se cuentan "Touch Me" ', 'sabrina@gmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
