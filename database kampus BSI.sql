/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.13-MariaDB : Database - kampus bsi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kampus bsi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kampus bsi`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `id_dosen` char(10) NOT NULL COMMENT 'nip',
  `nama_dosen` varchar(25) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tgl` int(8) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dosen` */

/*Table structure for table `jadwal` */

DROP TABLE IF EXISTS `jadwal`;

CREATE TABLE `jadwal` (
  `id_matkul` char(5) NOT NULL,
  `id_dosen` char(10) NOT NULL,
  `id_ruang` int(3) NOT NULL,
  `waktu` time NOT NULL,
  KEY `id_matkul` (`id_matkul`),
  KEY `id_dosen` (`id_dosen`),
  KEY `id_ruang` (`id_ruang`),
  CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`),
  CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`),
  CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`id_ruang`) REFERENCES `ruang` (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jadwal` */

/*Table structure for table `jurusan` */

DROP TABLE IF EXISTS `jurusan`;

CREATE TABLE `jurusan` (
  `id_jurusan` char(2) NOT NULL,
  `nama_jurusan` varchar(20) NOT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jurusan` */

/*Table structure for table `khs` */

DROP TABLE IF EXISTS `khs`;

CREATE TABLE `khs` (
  `id_mahasiswa` char(10) NOT NULL,
  `id_matkul` char(3) NOT NULL,
  `nilai` int(3) NOT NULL,
  KEY `id_mahasiswa` (`id_mahasiswa`),
  KEY `id_matkul` (`id_matkul`),
  CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `khs` */

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `id_matkul` char(5) NOT NULL,
  `id_mahasiswa` char(10) NOT NULL,
  `id_jurusan` char(2) NOT NULL,
  KEY `id_matkul` (`id_matkul`),
  KEY `id_mahasiswa` (`id_mahasiswa`),
  KEY `id_jurusan` (`id_jurusan`),
  CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`),
  CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`),
  CONSTRAINT `krs_ibfk_4` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `krs` */

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` char(10) NOT NULL COMMENT 'nim',
  `nama_mahasiswa` varchar(25) NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `tgl` int(8) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mahasiswa`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `krs` (`id_mahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mahasiswa` */

/*Table structure for table `matkul` */

DROP TABLE IF EXISTS `matkul`;

CREATE TABLE `matkul` (
  `id_matkul` char(5) NOT NULL,
  `nama_matkul` varchar(20) NOT NULL,
  `sks` int(2) NOT NULL,
  PRIMARY KEY (`id_matkul`),
  CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `krs` (`id_matkul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `matkul` */

/*Table structure for table `ruang` */

DROP TABLE IF EXISTS `ruang`;

CREATE TABLE `ruang` (
  `id_ruang` int(3) NOT NULL,
  PRIMARY KEY (`id_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ruang` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
