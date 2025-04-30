---SORGULAMA---
select * from GirisCikisKaydi;
select * from Hizmetler
select * from MusteriHizmetleri
select * from Musteriler
select * from Odalar
select * from Odemeler
select * from Personeller
select * from TemizlikKaydi
select * from Rezervasyonlar;
-----------------------------
select * from TemizlikKaydi
select * from Odalar

select o.Tip, t.Notlar, t.TemizlikTarihi from TemizlikKaydi t
join Odalar o
on t.OdaID = o.OdaID

--Hangi tip oda, hangi tarihte, nasýl silinmiþ +

select * from Musteriler
select * from MusteriHizmetleri
select * from Hizmetler

select m.Ad,m.Soyad,h.ad as Alýnan_Hizmet,h.Aciklama as Hizmet_Aciklamasi,h.Ucret,m2.AlimTarihi
from Musteriler m
join MusteriHizmetleri m2 on m.MusteriID = m2.MusteriID
join Hizmetler h on m2.HizmetID = h.HizmetID

--Hangi Müþteri, Hangi hizmeti, ne kadara, ne zaman almýþ +

select m.Ad,m.Soyad,sum(h.Ucret) as Toplam_Odedigi_Ucret
from Musteriler m
join MusteriHizmetleri m2 on m.MusteriID = m2.MusteriID
join Hizmetler h on m2.HizmetID=h.HizmetID
group by m.Ad,m.Soyad
order by Toplam_Odedigi_Ucret desc

--Hangi Müþteri, ne kadar harcamýþ + 

select * from GirisCikisKaydi
select * from Musteriler

select m.Ad,m.Soyad,DATEDIFF (DAY,g.GirisZamani,g.CikisZamani) as Kac_Gun_Kalinmis
from Musteriler m 
join GirisCikisKaydi g on m.MusteriID = g.MusteriID
order by Kac_Gun_Kalinmis desc;

--En çok hangi müþteri hotelde kalmýþ +

select * from Odalar
select * from Odemeler
select * from Rezervasyonlar


select o.Tip,round(avg(o2.Tutar),2) as Ortalama,o.Durum
from Odalar o
join Rezervasyonlar r on o.OdaID = r.OdaID
join Odemeler o2 on r.RezervasyonID = o2.RezervasyonID
where o.Durum = 'Boþ' and o2.OdemeTipi = 'Kredi Kartý' or o2.OdemeTipi = 'Onlime Ödeme'
group by o.Tip,o.Durum
order by Ortalama desc;

--Hangi tip odalara, kredi kartý veya online ödemeyle, boþ odalara ortalama ne kadar para harcanmýþ + 

select * from Personeller

SELECT
    SUM(CASE WHEN Maas > 14858.77 THEN 1 ELSE 0 END) AS YuksekMaasSayisi,
    SUM(CASE WHEN Maas > 11000.00 AND Maas <= 14858.77 THEN 1 ELSE 0 END) AS OrtalamaMaasSayisi,
    SUM(CASE WHEN Maas <= 11000.00 THEN 1 ELSE 0 END) AS DusukMaasSayisi,
	AVG(Maas) as Ortalama_Maas,
	COUNT(PersonelID) as Personel_Sayisi
FROM
    Personeller;


--yüksek,ortalama,düþük maaþ alanlarýn sayýsý, ortalama maaþ ve personel sayýsý +


select * from GirisCikisKaydi
select * from Musteriler
select * from Odemeler
select * from MusteriHizmetleri
select * from Hizmetler

select m.AlimTarihi,h.Ucret,
		LAG(h.Ucret,1,null) over (order by AlimTarihi) as OncekiGunHarcananPara,
		h.Ucret - LAG(h.Ucret,1,null) over (order by m.AlimTarihi) as OncekiGundenFarki,
		Lead(h.ucret,1,null) over (order by m.AlimTarihi) as SonrakiGunHarcananPara,
		lead(h.ucret,1,null) over (order by m.AlimTarihi) - h.Ucret as SonrakiGundenFarki
from MusteriHizmetleri m
join Hizmetler h
on m.HizmetID = h.HizmetID
group by m.AlimTarihi,h.Ucret
order by AlimTarihi desc

--önceki güne ve sonraki güne göre alýnan hizmetlerin birbirlerinden farklarý + 

select * from Hizmetler
select * from MusteriHizmetleri

with UrunSatis as (
	select
		h.Ad,
		sum(h.Ucret) as ToplamSatisMiktari
	from 
		Hizmetler h
	join 
		MusteriHizmetleri m on h.HizmetID = m.HizmetID
	group by
		h.Ad
),
SiraliUrunSatis as (
	select 
		Ad,
		ToplamSatisMiktari,
		RANK() over (order by ToplamSatisMiktari desc) as Sira
	from 
		UrunSatis
)
select 
	Ad,
	ToplamSatisMiktari,
	Sira
from 
	SiraliUrunSatis


--Toplamda en çok satýþý olan hizmetlerin sýralamasý +

select * from Hizmetler
select * from MusteriHizmetleri
select * from Musteriler

select m.Ad,m.Soyad from Musteriler m
join MusteriHizmetleri m2 on m.MusteriID = m2.MusteriID
join Hizmetler h on m2.HizmetID = h.HizmetID
where not exists (select 1 from MusteriHizmetleri m2 where m2.HizmetID = h.HizmetID)

--Hizmet Almayan Kiþiler (YOK) +

select * from TemizlikKaydi
select * from Odalar

select TOP 5 o.OdaNo,count(t.OdaID) as EnCokTemizlenenOdalar from Odalar o
join TemizlikKaydi t on o.OdaID = t.OdaID
group by o.OdaNo
order by EnCokTemizlenenOdalar desc;

--En çok temizlenen ilk 5 oda +

select * from Personeller

SELECT Pozisyon, COUNT(Pozisyon) AS PersonelSayisi, AVG(Maas) AS OrtalamaMaas 
FROM Personeller
GROUP BY Pozisyon
ORDER BY OrtalamaMaas desc;

--En çok maaþý alan pozisyon ve personel sayýlarý + 

select * from Personeller

SELECT
    MIN(IseBaslamaTarihi) AS EnErkenTarih,
    MAX(IseBaslamaTarihi) AS EnGecTarih
FROM
    Personeller;

--En erken ve en geç iþe baþlanýlan tarih + 

WITH TarihFarklari AS (
    SELECT
        DATEDIFF(day, '2020-05-18', IseBaslamaTarihi) AS GunFarki
    FROM
        Personeller
)
SELECT
    DATEADD(day, AVG(GunFarki), '2020-05-18') AS OrtalamaIseBaslamaYaklasimi
FROM
    TarihFarklari;

--Personellerin ortalama iþe baþlama tarihleri +

select * from Musteriler
select * from Odemeler
select * from Rezervasyonlar

select top 10 m.Telefon,m.Email,sum(o.Tutar) as ToplamTutar from Musteriler m
join Rezervasyonlar r on m.MusteriID = r.MusteriID
join Odemeler o on r.RezervasyonID = o.RezervasyonID
group by m.Telefon,m.Email
order by ToplamTutar asc

-- En az ödeme yapan 10 müþterinin telefon numaralarý ve mailler + 

select Aciklama,Ucret from Hizmetler
order by Ucret desc

-- Hizmetlerin açýklamalarý ile beraber ücretleri + 

