CREATE DATABASE IF NOT EXISTS ftpd;
USE ftpd;

CREATE USER IF NOT EXISTS 'ftpd'@'%' IDENTIFIED BY 'ftpd';
GRANT ALL PRIVILEGES ON ftpd.* TO 'ftpd'@'%' IDENTIFIED BY 'ftpd';

CREATE TABLE IF NOT EXISTS `ftpgroup` (
  `groupname` varchar(16) COLLATE utf8_general_ci NOT NULL,
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `members` varchar(16) COLLATE utf8_general_ci NOT NULL,
  KEY `groupname` (`groupname`)
);

CREATE TABLE IF NOT EXISTS `ftpuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(32) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `passwd` varchar(32) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` smallint(6) NOT NULL DEFAULT '5500',
  `gid` smallint(6) NOT NULL DEFAULT '5500',
  `homedir` varchar(255) COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `shell` varchar(16) COLLATE utf8_general_ci NOT NULL DEFAULT '/sbin/nologin', 
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`)
);

CREATE TABLE IF NOT EXISTS `log_DELETE` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` text NOT NULL,
  `userid` text NOT NULL,
  `time` datetime NOT NULL,
  `operation` text NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `log_LOGIN` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` text NOT NULL,
  `userid` text NOT NULL,
  `time` datetime NOT NULL,
  `operation` text NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `log_MODIFY` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` text NOT NULL,
  `userid` text NOT NULL,
  `time` datetime NOT NULL,
  `operation` text NOT NULL,
  `details` text,
  `from_` text,
  `to_` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `log_WRITE` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` text NOT NULL,
  `userid` text NOT NULL,
  `time` datetime NOT NULL,
  `operation` text NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `log_READ` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IP` text NOT NULL,
  `userid` text NOT NULL,
  `time` datetime NOT NULL,
  `operation` text NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
);
