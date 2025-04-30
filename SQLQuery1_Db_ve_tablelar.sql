CREATE DATABASE Hotel_Reservation;



-- Müþteriler tablosu
CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Telefon NVARCHAR(20),
    Email NVARCHAR(100)
);

-- Odalar tablosu
CREATE TABLE Odalar (
    OdaID INT PRIMARY KEY IDENTITY(1,1),
    OdaNo NVARCHAR(10),
    Tip NVARCHAR(50),
    Fiyat DECIMAL(10,2),
    Durum NVARCHAR(20) -- Örneðin: 'Boþ', 'Dolu'
);

-- Rezervasyonlar tablosu
CREATE TABLE Rezervasyonlar (
    RezervasyonID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    OdaID INT FOREIGN KEY REFERENCES Odalar(OdaID),
    GirisTarihi DATE,
    CikisTarihi DATE
);

-- Ödemeler tablosu
CREATE TABLE Odemeler (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    RezervasyonID INT FOREIGN KEY REFERENCES Rezervasyonlar(RezervasyonID),
    Tutar DECIMAL(10,2),
    OdemeTarihi DATE,
    OdemeTipi NVARCHAR(20) -- Örneðin: 'Nakit', 'Kredi Kartý'
);


CREATE TABLE Personeller (
    PersonelID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    Pozisyon NVARCHAR(50), -- örn: Resepsiyonist, Temizlikçi
    Maas DECIMAL(10,2),
    IseBaslamaTarihi DATE
);



CREATE TABLE TemizlikKaydi (
    KayitID INT PRIMARY KEY IDENTITY(1,1),
    OdaID INT FOREIGN KEY REFERENCES Odalar(OdaID),
    PersonelID INT FOREIGN KEY REFERENCES Personeller(PersonelID),
    TemizlikTarihi DATE,
    Notlar NVARCHAR(255)
);


	
CREATE TABLE Hizmetler (
    HizmetID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(100),
    Aciklama NVARCHAR(255),
    Ucret DECIMAL(10,2)
);


CREATE TABLE MusteriHizmetleri (
    KayitID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    HizmetID INT FOREIGN KEY REFERENCES Hizmetler(HizmetID),
    AlimTarihi DATE
);


CREATE TABLE GirisCikisKaydi (
    KayitID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT FOREIGN KEY REFERENCES Musteriler(MusteriID),
    GirisZamani DATETIME,
    CikisZamani DATETIME
);
