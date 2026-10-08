Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '()' at line 1
mysql> CREATE DATABASE();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '()' at line 1
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| escuela            |
| facultad           |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> CREATE DATABASE Hotel;
Query OK, 1 row affected (0.01 sec)

mysql> USE Hotel;
Database changed
mysql> CREATE TABLE Hotel(
    -> id_hotel INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> nombre VARCHAR(100) NOT NULL,
    -> direccion VARCHAR(150) NOT NULL);
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE TipoHabitacion(
    -> id_tipo_habitacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> nombre VARCHAR(50) NOT NULL UNIQUE);
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Cliente(
    -> id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> nombre VARCHAR(100) NOT NULL,
    -> pais_origen VARCHAR(60) NOT NULL);
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Habitacion(
    -> id_habitacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel),
    -> FOREIGN KEY (id_tipo_habitaci;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 4
mysql> CREATE TABLE Habitacion(
    -> id_habitacion INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> id_hotel INT UNSIGNED NOT NULL,
    -> id_tipo_habitacion INT UNSIGNED NOT NULL,
    -> fumador BOOLEAN NOT NULL,
    -> FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel),
    -> FOREIGN KEY (id_tipo_habitacion) REFERENCES Habitacion(id_habitacion));
Query OK, 0 rows affected (0.06 sec)

mysql> CREATE TABLE Reserva(
    -> id_reserva INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> id_cliente INT UNSIGNED NOT NULL,
    -> id_habitacion INT UNSIGNED NOT NULL,
    -> adultos TINYINT UNSIGNED NOT NULL CHECK(adultos>0),
    -> ninos TINYINT UNSIGNED DEFAULT 0,
    -> mascota BOOLEAN DEFAULT FALSE,
    -> fecha_inicio DATE NOT NULL,
    -> fecha_fin DATE NOT NULL CHECK(fecha_fin>=fecha_inicio));
ERROR 3813 (HY000): Column check constraint 'reserva_chk_2' references other column.
mysql> CREATE TABLE Reserva(
    -> id_reserva INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> id_cliente INT UNSIGNED NOT NULL,
    -> id_habitacion INT UNSIGNED NOT NULL,
    -> adultos TINYINT UNSIGNED NOT NULL CHECK(adultos>0),
    -> ninos TINYINT UNSIGNED DEFAULT 0,
    -> mascota BOOLEAN DEFAULT FALSE,
    -> fecha_inicio DATE NOT NULL,
    -> fecha_fin DATE NOT NULL CHECK(fecha_fin>=fecha_inicio),
    -> FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    -> FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion));
ERROR 3813 (HY000): Column check constraint 'reserva_chk_2' references other column.
mysql> CREATE TABLE Reserva(
    -> id_reserva INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> id_cliente INT UNSIGNED NOT NULL,
    -> id_habitacion INT UNSIGNED NOT NULL,
    -> adultos TINYINT UNSIGNED NOT NULL, CHECK(adultos>0),
    -> ninos TINYINT UNSIGNED DEFAULT 0,
    -> mascota BOOLEAN DEFAULT FALSE,
    -> fecha_inicio DATE NOT NULL,
    -> fecha_fin DATE NOT NULL, CHECK(fecha_fin>=fecha_inicio),
    -> FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    -> FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion));
Query OK, 0 rows affected (0.06 sec)

mysql> SHOW TABLES;
+-----------------+
| Tables_in_hotel |
+-----------------+
| cliente         |
| habitacion      |
| hotel           |
| reserva         |
| tipohabitacion  |
+-----------------+
5 rows in set (0.01 sec)

mysql> DESCRIBE Cliente;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id_cliente  | int unsigned | NO   | PRI | NULL    | auto_increment |
| nombre      | varchar(100) | NO   |     | NULL    |                |
| pais_origen | varchar(60)  | NO   |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Habitacion;
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| id_habitacion      | int unsigned | NO   | PRI | NULL    | auto_increment |
| id_hotel           | int unsigned | NO   | MUL | NULL    |                |
| id_tipo_habitacion | int unsigned | NO   | MUL | NULL    |                |
| fumador            | tinyint(1)   | NO   |     | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> DESCRIBE Hotel;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| id_hotel  | int unsigned | NO   | PRI | NULL    | auto_increment |
| nombre    | varchar(100) | NO   |     | NULL    |                |
| direccion | varchar(150) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Reserva;
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| id_reserva    | int unsigned     | NO   | PRI | NULL    | auto_increment |
| id_cliente    | int unsigned     | NO   | MUL | NULL    |                |
| id_habitacion | int unsigned     | NO   | MUL | NULL    |                |
| adultos       | tinyint unsigned | NO   |     | NULL    |                |
| ninos         | tinyint unsigned | YES  |     | 0       |                |
| mascota       | tinyint(1)       | YES  |     | 0       |                |
| fecha_inicio  | date             | NO   |     | NULL    |                |
| fecha_fin     | date             | NO   |     | NULL    |                |
+---------------+------------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> DESCRIBE TipoHabitacion;
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| id_tipo_habitacion | int unsigned | NO   | PRI | NULL    | auto_increment |
| nombre             | varchar(50)  | NO   | UNI | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql>