--DROP DATABASE IF EXISTS "Create_and_Insert";

CREATE DATABASE "Create_and_Insert";

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
('ferdi','+6013384444','ferdi@gmail.com','dupan', 29, 'L'::TEXT);

UPDATE nasabah SET Age = 32 where id = 2; 

DELETE FROM nasabah where id = 2; 

select * from nasabah;
select * from nasabah where id 3;


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
(1,'ahmad','ahmad123','Tabungan', TRUE);
(1,'ahmad2','ahmad123','Pergi Haji', FALSE);



