/*
SQLyog v10.2 
MySQL - 5.7.11-log : Database - db_flowertakeout
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_flowertakeout` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_flowertakeout`;

/*Table structure for table `t_flower` */

DROP TABLE IF EXISTS `t_flower`;

CREATE TABLE `t_flower` (
  `f_flowerId` bigint(20) NOT NULL COMMENT '鲜花id',
  `f_img` varchar(30) DEFAULT NULL COMMENT '图片名称',
  `f_flowerInfo` varchar(100) DEFAULT NULL COMMENT '鲜花信息->',
  `f_money` float DEFAULT NULL COMMENT '金额',
  `f_storeId` bigint(20) DEFAULT NULL COMMENT '对应店铺id',
  PRIMARY KEY (`f_flowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_flower` */

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `f_orderId` bigint(20) DEFAULT NULL COMMENT '订单id',
  `f_userId` bigint(20) DEFAULT NULL COMMENT '用户id',
  `f_flowerId` bigint(20) DEFAULT NULL COMMENT '鲜花id',
  `f_number` int(11) DEFAULT NULL COMMENT '数量',
  `f_suerMoney` float DEFAULT NULL COMMENT '实际付款',
  `f_dealState` varchar(10) DEFAULT NULL COMMENT '交易状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

/*Table structure for table `t_store` */

DROP TABLE IF EXISTS `t_store`;

CREATE TABLE `t_store` (
  `f_storeId` bigint(20) NOT NULL COMMENT '店铺id',
  `f_name` varchar(20) DEFAULT NULL COMMENT '名称',
  `f_address` varchar(50) DEFAULT NULL COMMENT '地址',
  `f_monthSellNumber` int(11) DEFAULT NULL COMMENT '月销量',
  `f_sellNumber` int(11) DEFAULT NULL COMMENT '销量',
  `f_storeDescribe` varchar(100) DEFAULT NULL COMMENT '商店描述',
  `f_goodAppraise` int(11) DEFAULT NULL COMMENT '评价(好)',
  `f_middleAppraise` int(11) DEFAULT NULL COMMENT '评价(中)',
  `f_badAppraise` int(11) DEFAULT NULL COMMENT '评价(差)',
  PRIMARY KEY (`f_storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_store` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `f_userid` bigint(20) NOT NULL COMMENT '用户Id',
  `f_username` varchar(30) DEFAULT NULL COMMENT '账号',
  `f_password` varchar(30) DEFAULT NULL COMMENT '密码',
  `f_sureName` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `f_sex` varchar(5) DEFAULT NULL COMMENT '性别',
  `f_phone` bigint(20) DEFAULT NULL COMMENT '电话',
  `f_address` varchar(50) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`f_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
