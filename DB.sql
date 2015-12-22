
/*********** ROOT ONLY ***********/
/*DROP DATABASE IF EXISTS u895145282_3arsl;

CREATE DATABASE u895145282_3arsl CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP USER IF EXISTS u895145282_nqb4f;
CREATE USER 'u895145282_nqb4f'@'%' IDENTIFIED BY 'S4WNX41oZbDH0p42ecok' PASSWORD EXPIRE NEVER;
GRANT SELECT,INSERT,UPDATE,DELETE,EXECUTE ON `u895145282_3arsl`.* TO 'u895145282_nqb4f'@'%';
*/

USE u895145282_3arsl;

DROP TABLE IF EXISTS relation_common cascade;
DROP TABLE IF EXISTS relation cascade;
DROP TABLE IF EXISTS friends cascade;
DROP TABLE IF EXISTS history cascade;
DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS soctype cascade;

CREATE TABLE soctype (
 STID INT UNSIGNED PRIMARY KEY,
 name VARCHAR(50) NOT NULL
);

CREATE TABLE users (
 UID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 STID INT UNSIGNED NOT NULL,
 login VARCHAR(50) NOT NULL,
 password CHAR(32) NOT NULL,
 FOREIGN KEY (STID) REFERENCES soctype(STID)
);

CREATE INDEX OPT_REG ON users (login(5));
CREATE INDEX OPT_LOGIN ON users (login(5), password(5));

CREATE TABLE friends (
 FID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 UID INT UNSIGNED NOT NULL,
 STID INT UNSIGNED NOT NULL,
 name VARCHAR(50) NOT NULL,
 FOREIGN KEY (UID) REFERENCES users(UID),
 FOREIGN KEY (STID) REFERENCES soctype(STID)
);

CREATE TABLE relation (
 RID INT UNSIGNED PRIMARY KEY,
 name VARCHAR(50) NOT NULL
);

CREATE TABLE relation_common (
 RCID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 STID_0 INT UNSIGNED NOT NULL,
 STID_1 INT UNSIGNED NOT NULL,
 RID INT UNSIGNED NOT NULL,
 FOREIGN KEY (STID_0) REFERENCES soctype(STID),
 FOREIGN KEY (STID_1) REFERENCES soctype(STID),
 FOREIGN KEY (RID) REFERENCES relation(RID)
);

CREATE TABLE history (
 HID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 UID INT UNSIGNED NOT NULL,
 tm TIMESTAMP,
 PHPSESID CHAR(32) NOT NULL,
 FOREIGN KEY (UID) REFERENCES users(UID)
);

CREATE INDEX OPT_LOGOUT ON history (PHPSESID(5));

INSERT INTO soctype(STID, name) VALUES
 (0, "Дон Кихот"),
 (1, "Дюма"),
 (2, "Гюго"),
 (3, "Робеспьер"),
 (4, "Гамлет"),
 (5, "Максим Горький"),
 (6, "Жуков"),
 (7, "Есенин"),
 (8, "Наполеон"),
 (9, "Бальзак"),
 (10, "Джек Лондон"),
 (11, "Драйзер"),
 (12, "Штирлиц"),
 (13, "Достоевский"),
 (14, "Гексли"),
 (15, "Габен");

INSERT INTO users(STID, login, password) VALUES
 (2, "Stoneface", "9901c75d2a7b37d2c62207083f20cafe"),
 (1, "Trollface", "5afd0be3923bfde769ba747a4dfe2dcd");

SET @U0 = (SELECT UID FROM users WHERE login='Stoneface');
SET @U1 = (SELECT UID FROM users WHERE login='Trollface');
 
INSERT INTO friends(UID, STID, name) VALUES
 (@U0, 2, "Hugh Darrow"),
 (@U0, 1, "Bob Page"),
 (@U0, 0, "Lawrence Barrett"),
 (@U0, 1, "Jaron Namir"),
 (@U1, 3, "Yelena Fedorova"),
 (@U1, 3, "William Taggart"),
 (@U1, 0, "Isaias Sandoval"),
 (@U1, 1, "David Sarif"),
 (@U1, 0, "Ezekiel Sanders");
 
INSERT INTO relation(RID, name) VALUES
 (0, "Тождественные"),
 (1, "Дуальные"),
 (2, "Активации"),
 (3, "Зеркальные"),
 (4, "Исполнитель"),
 (5, "Подконтрольный"),
 (6, "Деловые"),
 (7, "Миражные"),
 (8, "Суперэго"),
 (9, "Противоположность"),
 (10, "Квазитождество"),
 (11, "Конфликтные"),
 (12, "Заказчик"),
 (13, "Контролер"),
 (14, "Родственные"),
 (15, "Полудуальные");

INSERT INTO relation_common(STID_0, STID_1, RID) VALUES
 (0, 0, 0),
 (0, 1, 1),
 (0, 2, 2),
 (0, 3, 3),
 (0, 4, 4),
 (0, 5, 5),
 (0, 6, 6),
 (0, 7, 7),
 (0, 8, 8),
 (0, 9, 9),
 (0, 10, 10),
 (0, 11, 11),
 (0, 12, 12),
 (0, 13, 13),
 (0, 14, 14),
 (0, 15, 15),
 (1, 0, 1),
 (1, 1, 0),
 (1, 2, 3),
 (1, 3, 2),
 (1, 4, 5),
 (1, 5, 4),
 (1, 6, 7),
 (1, 7, 6),
 (1, 8, 9),
 (1, 9, 8),
 (1, 10, 11),
 (1, 11, 10),
 (1, 12, 13),
 (1, 13, 12),
 (1, 14, 15),
 (1, 15, 14),
 (2, 0, 2),
 (2, 1, 3),
 (2, 2, 0),
 (2, 3, 1),
 (2, 4, 14),
 (2, 5, 15),
 (2, 6, 12),
 (2, 7, 13),
 (2, 8, 10),
 (2, 9, 11),
 (2, 10, 8),
 (2, 11, 9),
 (2, 12, 6),
 (2, 13, 7),
 (2, 14, 4),
 (2, 15, 5),
 (3, 0, 3),
 (3, 1, 2),
 (3, 2, 1),
 (3, 3, 0),
 (3, 4, 15),
 (3, 5, 14),
 (3, 6, 12),
 (3, 7, 13),
 (3, 8, 11),
 (3, 9, 10),
 (3, 10, 9),
 (3, 11, 8),
 (3, 12, 7),
 (3, 13, 6),
 (3, 14, 5),
 (3, 15, 4),
 (4, 0, 12),
 (4, 1, 13),
 (4, 2, 14),
 (4, 3, 15),
 (4, 4, 0),
 (4, 5, 1),
 (4, 6, 2),
 (4, 7, 3),
 (4, 8, 4),
 (4, 9, 5),
 (4, 10, 6),
 (4, 11, 7),
 (4, 12, 8),
 (4, 13, 9),
 (4, 14, 10),
 (4, 15, 11),
 (5, 0, 13),
 (5, 1, 12),
 (5, 2, 15),
 (5, 3, 14),
 (5, 4, 1),
 (5, 5, 0),
 (5, 6, 3),
 (5, 7, 2),
 (5, 8, 5),
 (5, 9, 4),
 (5, 10, 7),
 (5, 11, 6),
 (5, 12, 9),
 (5, 13, 8),
 (5, 14, 11),
 (5, 15, 10),
 (6, 0, 6),
 (6, 1, 7),
 (6, 2, 4),
 (6, 3, 5),
 (6, 4, 2),
 (6, 5, 3),
 (6, 6, 0),
 (6, 7, 1),
 (6, 8, 14),
 (6, 9, 15),
 (6, 10, 12),
 (6, 11, 13),
 (6, 12, 10),
 (6, 13, 11),
 (6, 14, 8),
 (6, 15, 9),
 (7, 0, 7),
 (7, 1, 6),
 (7, 2, 5),
 (7, 3, 4),
 (7, 4, 3),
 (7, 5, 2),
 (7, 6, 1),
 (7, 7, 0),
 (7, 8, 15),
 (7, 9, 14),
 (7, 10, 13),
 (7, 11, 12),
 (7, 12, 11),
 (7, 13, 10),
 (7, 14, 9),
 (7, 15, 8),
 (8, 0, 8),
 (8, 1, 9),
 (8, 2, 10),
 (8, 3, 11),
 (8, 4, 12),
 (8, 5, 13),
 (8, 6, 14),
 (8, 7, 15),
 (8, 8, 0),
 (8, 9, 1),
 (8, 10, 2),
 (8, 11, 3),
 (8, 12, 4),
 (8, 13, 5),
 (8, 14, 6),
 (8, 15, 7),
 (9, 0, 9),
 (9, 1, 8),
 (9, 2, 11),
 (9, 3, 10),
 (9, 4, 13),
 (9, 5, 12),
 (9, 6, 15),
 (9, 7, 14),
 (9, 8, 1),
 (9, 9, 0),
 (9, 10, 3),
 (9, 11, 2),
 (9, 12, 5),
 (9, 13, 4),
 (9, 14, 7),
 (9, 15, 6),
 (10, 0, 10),
 (10, 1, 11),
 (10, 2, 8),
 (10, 3, 9),
 (10, 4, 6),
 (10, 5, 7),
 (10, 6, 4),
 (10, 7, 5),
 (10, 8, 2),
 (10, 9, 3),
 (10, 10, 0),
 (10, 11, 1),
 (10, 12, 14),
 (10, 13, 15),
 (10, 14, 12),
 (10, 15, 13),
 (11, 0, 11),
 (11, 1, 10),
 (11, 2, 9),
 (11, 3, 8),
 (11, 4, 7),
 (11, 5, 6),
 (11, 6, 5),
 (11, 7, 4),
 (11, 8, 3),
 (11, 9, 2),
 (11, 10, 1),
 (11, 11, 0),
 (11, 12, 15),
 (11, 13, 14),
 (11, 14, 13),
 (11, 15, 12),
 (12, 0, 4),
 (12, 1, 5),
 (12, 2, 6),
 (12, 3, 7),
 (12, 4, 8),
 (12, 5, 9),
 (12, 6, 10),
 (12, 7, 11),
 (12, 8, 12),
 (12, 9, 13),
 (12, 10, 14),
 (12, 11, 15),
 (12, 12, 0),
 (12, 13, 1),
 (12, 14, 2),
 (12, 15, 3),
 (13, 0, 5),
 (13, 1, 4),
 (13, 2, 7),
 (13, 3, 6),
 (13, 4, 9),
 (13, 5, 8),
 (13, 6, 11),
 (13, 7, 10),
 (13, 8, 13),
 (13, 9, 12),
 (13, 10, 15),
 (13, 11, 14),
 (13, 12, 1),
 (13, 13, 0),
 (13, 14, 3),
 (13, 15, 2),
 (14, 0, 14),
 (14, 1, 15),
 (14, 2, 12),
 (14, 3, 13),
 (14, 4, 10),
 (14, 5, 11),
 (14, 6, 8),
 (14, 7, 9),
 (14, 8, 6),
 (14, 9, 7),
 (14, 10, 4),
 (14, 11, 5),
 (14, 12, 2),
 (14, 13, 3),
 (14, 14, 0),
 (14, 15, 1),
 (15, 0, 15),
 (15, 1, 14),
 (15, 2, 13),
 (15, 3, 12),
 (15, 4, 11),
 (15, 5, 10),
 (15, 6, 9),
 (15, 7, 8),
 (15, 8, 7),
 (15, 9, 6),
 (15, 10, 5),
 (15, 11, 4),
 (15, 12, 3),
 (15, 13, 2),
 (15, 14, 1),
 (15, 15, 0);

CREATE INDEX OPT_RCS ON relation_common (STID_0, STID_1);
 
 DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateUserHistory$$

CREATE PROCEDURE `UpdateUserHistory`(IN uid INT UNSIGNED, IN sesid char(32))
BEGIN
	SET @hid = (SELECT HID FROM history WHERE UID = uid);
	IF isnull(@hid) THEN INSERT INTO history(UID, tm, PHPSESID) VALUES(uid, NOW(), sesid);
	ELSE UPDATE history SET tm = NOW(), PHPSESID = sesid WHERE UID = uid;
	END IF;
END$$

DELIMITER ;
 
 