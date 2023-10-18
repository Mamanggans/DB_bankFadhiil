--DROP DATABASE IF EXISTS "Create_and_Insert";

--DROP TABLE NASABAH;

CREATE TABLE IF NOT EXISTS nasabah (
	ID SERIAL NOT NULL PRIMARY KEY,
	Nama VARCHAR(255),
	Phone VARCHAR(255),
	Email VARCHAR(255),
	Address_Nasabah VARCHAR(255),
	Age INT,
	Gender VARCHAR(1) CHECK (Gender IN ('L', 'P')),
	CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO nasabah (Nama, Phone, Email, Address_Nasabah, Age, Gender)
VALUES
('Achmad','+62878694321','achmad@gmail.com','Jl.Kali kali', 18, 'L'::TEXT),
('ferdi','+6013384444','ferdi@gmail.com','dupan', 29, 'L'::TEXT),
('aripin','+6272678416','aripin@gmail.com','dupat', 26, 'L'::TEXT);

--alter table 
--alter table nasabah 
--rename to customers;

-- alter table add 
alter table nasabah
add column BirthDate date;

UPDATE nasabah SET Age = 32 where id = 2; 

DELETE FROM nasabah where id = 2; 

select * from nasabah;
select * from nasabah where ID = 1;


CREATE TABLE IF NOT EXISTS akun (
	ID SERIAL NOT NULL PRIMARY KEY,
	IDNasabah int NOT NULL,
	username VARCHAR(255),
	password VARCHAR(255),
	IsFor VARCHAR(25) CHECK (IsFor IN ('Tabungan', 'Pergi Haji', 'investasi')),
	IsActive BOOLEAN,
	CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (IDNasabah) REFERENCES nasabah(ID)
);

INSERT INTO akun (IDNasabah, username, password, IsFor, IsActive)
VALUES 
(1,'ahmad','ahmad123','Tabungan', TRUE),
(1,'ahmad2','ahmad123','Pergi Haji', FALSE),
(1,'ahmad3','ahmad123','investasi', TRUE);

--alter table 
--alter table akun 
--rename to account;

UPDATE akun SET username = 'ahmadtiga' where id = 3; 

DELETE FROM akun where id = 3;

select * from akun;
select * from akun where id = 1;


CREATE TABLE if NOT EXISTS transaksi (
	ID SERIAL NOT NULL PRIMARY KEY,
	IdAccount int NOT NULL,
	Transaction_type VARCHAR(255),
	Amount int NOT NULL,
	CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (IdAccount) REFERENCES akun(ID)
);

INSERT INTO transaksi (IdAccount, Transaction_type, Amount)
VALUES
(1, 'Deposit', 50000),
(1, 'Deposit', 4000000),
(1, 'Withdrawal', -100000),
(2, 'Deposit', 100000);

UPDATE transaksi SET Amount = 2000 where id = 1; 

DELETE FROM transaksi where id = 3;

select * from transaksi;
select * from transaksi where id = 1;