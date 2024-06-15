/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.16-MariaDB-log : Database - perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `perpustakaan`;

/*Table structure for table `tb_buku` */

DROP TABLE IF EXISTS `tb_buku`;

CREATE TABLE `tb_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) DEFAULT NULL,
  `penulis_id` int(11) DEFAULT NULL,
  `penerbit_id` int(11) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tgl_pendaftaran` date DEFAULT NULL,
  `rak_id` int(11) DEFAULT NULL,
  `kota_terbit_id` int(11) DEFAULT NULL,
  `tipe_buku_id` int(11) DEFAULT NULL,
  `isbn_issn` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `edisi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penulis_id` (`penulis_id`),
  KEY `penerbit_id` (`penerbit_id`),
  KEY `rak_id` (`rak_id`),
  KEY `kota_terbit_id` (`kota_terbit_id`),
  KEY `tipe_buku_id` (`tipe_buku_id`),
  CONSTRAINT `tb_buku_ibfk_1` FOREIGN KEY (`penulis_id`) REFERENCES `tb_penulis` (`id`),
  CONSTRAINT `tb_buku_ibfk_2` FOREIGN KEY (`penerbit_id`) REFERENCES `tb_penerbit` (`id`),
  CONSTRAINT `tb_buku_ibfk_3` FOREIGN KEY (`rak_id`) REFERENCES `tb_rak` (`id`),
  CONSTRAINT `tb_buku_ibfk_4` FOREIGN KEY (`kota_terbit_id`) REFERENCES `tb_kota_terbit` (`id`),
  CONSTRAINT `tb_buku_ibfk_5` FOREIGN KEY (`tipe_buku_id`) REFERENCES `tb_tipe_buku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_buku` */

insert  into `tb_buku`(`id`,`judul`,`penulis_id`,`penerbit_id`,`tahun_terbit`,`jumlah`,`tgl_pendaftaran`,`rak_id`,`kota_terbit_id`,`tipe_buku_id`,`isbn_issn`,`volume`,`edisi`) values 
(1,'harry potter dan batu bertuah',1,1,1997,2,'2021-11-07',1,1,1,'0-7475-3269-9',NULL,NULL),
(2,'binging with babish: 100 recipes recreated from your favorite movies and tv shows',2,2,2019,3,'2021-11-07',2,2,1,'978-1328589897',NULL,NULL),
(3,'harry potter dan kamar rahasia',1,1,1998,2,'2021-11-07',1,1,1,'979-655-851-3 ',NULL,NULL),
(4,'harry potter dan tawanan azkaban',1,1,1999,2,'2021-11-07',1,1,1,'9786020342733',NULL,NULL),
(11,'test1',5,5,2021,1,'2021-12-05',1,1,1,'12141',NULL,NULL),
(12,'test2',NULL,5,2019,2,'2021-12-06',1,3,2,'123110','2',NULL),
(13,'majalahtest',NULL,6,2017,3,'2021-12-06',2,4,3,'167180',NULL,'2 November 2020');

/*Table structure for table `tb_denda` */

DROP TABLE IF EXISTS `tb_denda`;

CREATE TABLE `tb_denda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan_denda` varchar(200) DEFAULT NULL,
  `jenis_denda_id` int(11) DEFAULT NULL,
  `detail_pengembalian_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jenis_denda_id` (`jenis_denda_id`),
  KEY `detail_pengembalian_id` (`detail_pengembalian_id`),
  CONSTRAINT `tb_denda_ibfk_1` FOREIGN KEY (`jenis_denda_id`) REFERENCES `tb_jenis_denda` (`id`),
  CONSTRAINT `tb_denda_ibfk_2` FOREIGN KEY (`detail_pengembalian_id`) REFERENCES `tb_detail_pengembalian` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_denda` */

insert  into `tb_denda`(`id`,`keterangan_denda`,`jenis_denda_id`,`detail_pengembalian_id`) values 
(1,'buku rusak',2,5),
(2,'buku rusak',2,6);

/*Table structure for table `tb_detail_peminjaman` */

DROP TABLE IF EXISTS `tb_detail_peminjaman`;

CREATE TABLE `tb_detail_peminjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buku_id` int(11) DEFAULT NULL,
  `peminjaman_id` int(11) DEFAULT NULL,
  `status_buku` enum('dipinjam','kembali') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_id` (`buku_id`),
  KEY `peminjaman_id` (`peminjaman_id`),
  CONSTRAINT `tb_detail_peminjaman_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `tb_buku` (`id`),
  CONSTRAINT `tb_detail_peminjaman_ibfk_2` FOREIGN KEY (`peminjaman_id`) REFERENCES `tb_peminjaman` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_detail_peminjaman` */

insert  into `tb_detail_peminjaman`(`id`,`buku_id`,`peminjaman_id`,`status_buku`) values 
(1,1,1,'kembali'),
(2,2,1,'kembali'),
(3,3,1,'kembali'),
(4,1,2,'kembali'),
(5,11,2,'kembali'),
(7,4,3,'kembali'),
(8,1,6,'dipinjam');

/*Table structure for table `tb_detail_pengembalian` */

DROP TABLE IF EXISTS `tb_detail_pengembalian`;

CREATE TABLE `tb_detail_pengembalian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buku_id` int(11) DEFAULT NULL,
  `pengembalian_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_id` (`buku_id`),
  KEY `pengembalian_id` (`pengembalian_id`),
  CONSTRAINT `tb_detail_pengembalian_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `tb_buku` (`id`),
  CONSTRAINT `tb_detail_pengembalian_ibfk_2` FOREIGN KEY (`pengembalian_id`) REFERENCES `tb_pengembalian` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_detail_pengembalian` */

insert  into `tb_detail_pengembalian`(`id`,`buku_id`,`pengembalian_id`) values 
(1,1,1),
(2,2,1),
(3,3,1),
(5,1,2),
(6,2,2),
(7,4,3),
(11,11,8);

/*Table structure for table `tb_jenis_denda` */

DROP TABLE IF EXISTS `tb_jenis_denda`;

CREATE TABLE `tb_jenis_denda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_denda` varchar(100) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_jenis_denda` */

insert  into `tb_jenis_denda`(`id`,`jenis_denda`,`biaya`) values 
(1,'telat',5000),
(2,'rusak_ringan',15000),
(3,'hilang',50000),
(4,'none',0),
(5,'rusak_berat',50000);

/*Table structure for table `tb_kota_terbit` */

DROP TABLE IF EXISTS `tb_kota_terbit`;

CREATE TABLE `tb_kota_terbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_kota_terbit` */

insert  into `tb_kota_terbit`(`id`,`nama_kota`) values 
(1,'jakarta'),
(2,'new york'),
(3,'test'),
(4,'majalahtest');

/*Table structure for table `tb_member` */

DROP TABLE IF EXISTS `tb_member`;

CREATE TABLE `tb_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `No_hp` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tgl_daftar` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_member` */

insert  into `tb_member`(`id`,`nama`,`jenis_kelamin`,`tanggal_lahir`,`No_hp`,`email`,`alamat`,`tgl_daftar`) values 
(1,'Joko','laki-laki','2021-11-03','081599087675','joko@email.com','Jl.EFG No.10','2021-11-08'),
(2,'Budi','laki-laki','2021-11-10','081213150908','budi@email.com','Jl.ABC No.55','2021-11-10'),
(16,'test','laki-laki','2021-11-23','081213150706','testemail','jl.test no123','2021-11-23'),
(17,'test1','laki-laki','2021-11-23','081314158787','test1email','jl.test1','2021-11-23'),
(18,'test2','laki-laki','2021-11-23','081708089797','testemail2','jl.test2','2021-11-23');

/*Table structure for table `tb_pegawai` */

DROP TABLE IF EXISTS `tb_pegawai`;

CREATE TABLE `tb_pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pegawai` */

insert  into `tb_pegawai`(`id`,`nama`,`jenis_kelamin`,`no_hp`,`password`,`username`) values 
(1,'Budi','laki-laki','081213141517','*77F4641D62DFD22BE28C2DBAEA0D18047EFAC5AE','budi123'),
(2,'Andi','laki-laki','081812124343','*85CA8FE58B30ADB6D5C8765FC7CD61BD376B72BD','andi1212'),
(3,'Kiki','perempuan','081312179098','*746B221E1F554FE4D811D2468584C8012140B5D1','kiki321'),
(4,'admin',NULL,NULL,'*4ACFE3202A5FF5CF467898FC58AAB1D615029441','admin'),
(5,'Yamto','laki-laki','086859876865','yamto','yamto');

/*Table structure for table `tb_peminjaman` */

DROP TABLE IF EXISTS `tb_peminjaman`;

CREATE TABLE `tb_peminjaman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pegawai_id` (`pegawai_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `tb_peminjaman_ibfk_2` FOREIGN KEY (`pegawai_id`) REFERENCES `tb_pegawai` (`id`),
  CONSTRAINT `tb_peminjaman_ibfk_3` FOREIGN KEY (`member_id`) REFERENCES `tb_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_peminjaman` */

insert  into `tb_peminjaman`(`id`,`pegawai_id`,`member_id`,`tgl_pinjam`,`tgl_kembali`) values 
(1,1,1,'2021-11-01','2021-11-09'),
(2,1,1,'2021-11-12','2021-12-31'),
(3,1,2,'2021-11-15','2021-12-31'),
(4,1,2,'2021-11-15','2021-11-14'),
(6,1,2,'2021-12-17','2021-12-24');

/*Table structure for table `tb_penerbit` */

DROP TABLE IF EXISTS `tb_penerbit`;

CREATE TABLE `tb_penerbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_penerbit` */

insert  into `tb_penerbit`(`id`,`nama`) values 
(1,'pt.gramedia'),
(2,'mariner books'),
(3,'pt thc mandiri'),
(4,'republika penerbit'),
(5,'test'),
(6,'majalahtest');

/*Table structure for table `tb_pengembalian` */

DROP TABLE IF EXISTS `tb_pengembalian`;

CREATE TABLE `tb_pengembalian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peminjaman_id` int(11) DEFAULT NULL,
  `pegawai_id` int(11) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peminjaman_id` (`peminjaman_id`),
  KEY `pegawai_id` (`pegawai_id`),
  CONSTRAINT `tb_pengembalian_ibfk_2` FOREIGN KEY (`peminjaman_id`) REFERENCES `tb_peminjaman` (`id`),
  CONSTRAINT `tb_pengembalian_ibfk_4` FOREIGN KEY (`pegawai_id`) REFERENCES `tb_pegawai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pengembalian` */

insert  into `tb_pengembalian`(`id`,`peminjaman_id`,`pegawai_id`,`tgl_kembali`) values 
(1,1,1,'2021-12-05'),
(2,2,1,'2021-12-03'),
(3,3,1,'2021-12-11'),
(8,2,1,'2021-12-17');

/*Table structure for table `tb_penulis` */

DROP TABLE IF EXISTS `tb_penulis`;

CREATE TABLE `tb_penulis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_penulis` */

insert  into `tb_penulis`(`id`,`nama`) values 
(1,'j.k. rowling'),
(2,'andrew rea'),
(3,'b.j. habibie'),
(5,'test');

/*Table structure for table `tb_rak` */

DROP TABLE IF EXISTS `tb_rak`;

CREATE TABLE `tb_rak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_rak` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_rak` */

insert  into `tb_rak`(`id`,`no_rak`) values 
(1,1),
(2,2);

/*Table structure for table `tb_tag` */

DROP TABLE IF EXISTS `tb_tag`;

CREATE TABLE `tb_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_tag` */

insert  into `tb_tag`(`id`,`tag`) values 
(1,'Romance'),
(2,'Sci-Fi'),
(3,'Fantasy'),
(4,'Horror'),
(5,'Mystery'),
(6,'Historical'),
(7,'Biography'),
(8,'Cooking'),
(9,'Business'),
(10,'Comedy'),
(11,'Detective'),
(12,'Adventure'),
(13,'Teen'),
(14,'Children'),
(15,'Art & Photography'),
(16,'Personal Development'),
(17,'Motivational'),
(18,'Health & Fitness'),
(19,'Crafts & Hobbies'),
(20,'Families & Relationship'),
(21,'Law & Criminology'),
(22,'Politics & Social Science'),
(23,'Religion & Spirituality'),
(24,'Education'),
(25,'Travel'),
(26,'Novel'),
(27,'Comic'),
(28,'Encyclopedia'),
(29,'Dictionary'),
(30,'SMA'),
(31,'SMP'),
(32,'SD'),
(33,'Math'),
(34,'Biology'),
(35,'Computer'),
(36,'Chemistry'),
(37,'Geography'),
(38,'Physical Education'),
(39,'Music'),
(40,'Civics'),
(41,'English'),
(42,'Bahasa Indonesia'),
(43,'Physics'),
(44,'Entrepreneurship'),
(45,'Folktale');

/*Table structure for table `tb_tag_buku` */

DROP TABLE IF EXISTS `tb_tag_buku`;

CREATE TABLE `tb_tag_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buku_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buku_id` (`buku_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tb_tag_buku_ibfk_1` FOREIGN KEY (`buku_id`) REFERENCES `tb_buku` (`id`),
  CONSTRAINT `tb_tag_buku_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tb_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_tag_buku` */

insert  into `tb_tag_buku`(`id`,`buku_id`,`tag_id`) values 
(1,1,26),
(2,1,3),
(3,2,8),
(4,2,19),
(5,3,3),
(6,3,26),
(7,4,3),
(8,4,26),
(18,11,2),
(21,12,35),
(22,13,9),
(23,12,26);

/*Table structure for table `tb_tipe_buku` */

DROP TABLE IF EXISTS `tb_tipe_buku`;

CREATE TABLE `tb_tipe_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipe_buku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_tipe_buku` */

insert  into `tb_tipe_buku`(`id`,`tipe_buku`) values 
(1,'Buku'),
(2,'Jurnal'),
(3,'Majalah');

/* Procedure structure for procedure `log_in_pegawai` */

/*!50003 DROP PROCEDURE IF EXISTS  `log_in_pegawai` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `log_in_pegawai`(IN `username` VARCHAR(100), IN `pass` VARCHAR(100))
BEGIN
		DECLARE isValid INT;
		
		SET isValid = (SELECT COUNT(tb_pegawai.id) FROM tb_pegawai WHERE tb_pegawai.username = username AND tb_pegawai.password = PASSWORD(pass));
		
		IF(isValid = 1) THEN
			SELECT tb_pegawai.id INTO @id_pegawai_log_in FROM tb_pegawai WHERE tb_pegawai.username = username AND tb_pegawai.password = PASSWORD(pass);
			set @isLoggedIn = 1;
		ELSE
			SET @isLoggedIn = 0;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sign_up_pegawai` */

/*!50003 DROP PROCEDURE IF EXISTS  `sign_up_pegawai` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_up_pegawai`(IN `nama` VARCHAR(100), IN `jenis_kelamin` ENUM('laki-laki','perempuan'), IN `no_hp` VARCHAR(15), IN `pass` VARCHAR(100), IN `username` VARCHAR(100))
BEGIN
		declare isAvailable int;
		
		set isAvailable = (select count(tb_pegawai.id) from tb_pegawai where tb_pegawai.username = username);
		set pass = password(pass);
		
		if(isAvailable = 0) then
			insert into tb_pegawai (nama,jenis_kelamin,no_hp,`password`,username)
			values (nama,jenis_kelamin,no_hp,pass,username);
			select "Sign up berhasil !" as "Notice";
		else
			select "Username sudah digunakan" as "Notice";
		end if;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
