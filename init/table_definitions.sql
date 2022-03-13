use zoo;

SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

DROP TABLE IF EXISTS `Druhy`;
CREATE TABLE IF NOT EXISTS `Druhy`
(
    `id`       int(11) NOT NULL auto_increment,
    `nazev`    varchar(256) collate utf8_czech_ci default NULL,
    `vaha_min` decimal(10, 0)                     default NULL COMMENT 'Minimalni vaha v kilogramech',
    `vaha_max` decimal(10, 0)                     default NULL COMMENT 'Maximalni vaha v kilogramech',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 106;


DROP TABLE IF EXISTS `Jidelnicek`;
CREATE TABLE IF NOT EXISTS `Jidelnicek`
(
    `id`         int(11) NOT NULL auto_increment,
    `zvire`      int(11) NOT NULL,
    `potrava`    int(11) NOT NULL,
    `jednotek`   decimal(6,
                     0)  NOT NULL,
    `cas_krmeni` datetime default NULL,
    PRIMARY KEY
        (
         `id`
            )
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Ma_rad`;
CREATE TABLE IF NOT EXISTS `Ma_rad`
(
    `id`          int(11) NOT NULL auto_increment,
    `osetrovatel` int(11) NOT NULL,
    `druh`        int(11) NOT NULL,
    PRIMARY KEY
        (
         `id`
            )
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;


DROP TABLE IF EXISTS `Osetrovatele`;
CREATE TABLE IF NOT EXISTS `Osetrovatele`
(
    `id`      int(11) NOT NULL auto_increment,
    `jmeno`   varchar(256) collate utf8_czech_ci default NULL,
    `narozen` date                               default NULL COMMENT 'Datum narozeni',
    PRIMARY KEY
        (
         `id`
            )
) ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;


DROP TABLE IF EXISTS `Osetruje`;
CREATE TABLE IF NOT EXISTS `Osetruje`
(
    `id`          int(11) NOT NULL auto_increment,
    `osetrovatel` int(11) NOT NULL,
    `zvire`       int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Potrava`;
CREATE TABLE IF NOT EXISTS `Potrava`
(
    `id`        int(11) NOT NULL auto_increment,
    `nazev`     varchar(256) collate utf8_czech_ci default NULL,
    `kalorie`   int(6)                             default NULL COMMENT 'Kalorie na jednotku potravy',
    `bilkoviny` decimal(6, 0)                      default NULL COMMENT 'Bilkoviny na jednotku potravy',
    `sacharidy` decimal(6, 0)                      default NULL COMMENT 'Sacharidy na jednotku potravy',
    `tuky`      decimal(6, 0)                      default NULL COMMENT 'Tuky na jednotku potravy',
    `vaha`      decimal(6, 0)                      default NULL COMMENT 'Vaha jednotky potravy v kilogramech',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Zere`;
CREATE TABLE IF NOT EXISTS `Zere`
(
    `id`      int(11) NOT NULL auto_increment,
    `druh`    int(11) NOT NULL,
    `potrava` int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci
  AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Zvirata`;
CREATE TABLE IF NOT EXISTS `Zvirata`
(
    `id`       int(11) NOT NULL auto_increment,
    `druh`     int(11)                            default NULL,
    `jmeno`    varchar(256) collate utf8_czech_ci default NULL,
    `vaha`     decimal(10, 0)                     default NULL COMMENT 'Vaha v kilogramech',
    `narozen`  date                               default NULL,
    `spotreba` int(6)                             default NULL COMMENT 'Denni spotreba energie v kaloriich',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_czech_ci COMMENT ='Tabulka jednotlivych zvirat'
  AUTO_INCREMENT = 2477;


CREATE TABLE IF NOT EXISTS `Ma_rad` (
                                        `id` int(11) NOT NULL auto_increment,
                                        `osetrovatel` int(11) NOT NULL,
                                        `druh` int(11) NOT NULL,
                                        PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=1500 ;

CREATE TABLE IF NOT EXISTS `Osetruje` (
                                          `id` int(11) NOT NULL auto_increment,
                                          `osetrovatel` int(11) NOT NULL,
                                          `zvire` int(11) NOT NULL,
                                          PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci AUTO_INCREMENT=4999 ;
