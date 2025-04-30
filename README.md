# 🏨 Hotel Reservation Veritabanı

Bu proje, SQL Server kullanılarak geliştirilmiş bir otel rezervasyon veritabanı sistemidir. Müşteri, oda, rezervasyon, ödeme, personel ve hizmet gibi otel operasyonlarının tamamını kapsayan bir veritabanı yapısı içerir.

---

## 📌 Proje Özellikleri

- Müşteri kayıt ve takibi
- Oda bilgileri ve doluluk durumu
- Rezervasyon giriş/çıkış işlemleri
- Ödeme kayıtları ve raporlamaları
- Personel yönetimi
- Temizlik kayıtları
- Ekstra hizmetler ve müşteri hizmet geçmişi
- Günlük giriş/çıkış hareketleri takibi

---

## 🗃️ Veritabanı Tabloları

| Tablo Adı             | Açıklama                                                      |
|-----------------------|---------------------------------------------------------------|
| `Musteriler`          | Müşteri bilgilerini içerir                                     |
| `Odalar`              | Oda numarası, tipi, fiyatı ve durumu                           |
| `Rezervasyonlar`      | Müşteri ve oda bazlı giriş-çıkış tarihleri                     |
| `Odemeler`            | Rezervasyonlara bağlı ödeme tutarı ve tipi                     |
| `Personeller`         | Otelde görev yapan personellerin bilgileri                     |
| `TemizlikKaydi`       | Odaların temizlik geçmişi                                      |
| `Hizmetler`           | Otelin sunduğu ekstra hizmetler                                |
| `MusteriHizmetleri`   | Müşterilerin aldığı hizmet geçmişi                             |
| `GirisCikisKaydi`     | Müşterilerin günlük giriş-çıkış zamanları                      |

---

## 🧩 ER Diyagramı

Veritabanının genel yapısını gösteren ER (Entity Relationship) diyagramı aşağıda sunulmuştur:

![ER Diyagramı](https://raw.githubusercontent.com/keremkarayaz/Hotel-Reservation_Query/refs/heads/main/SQL_Hotel_Diagram.png)


---

## 💻 Kullanım

### 1. Veritabanı ve Verilerin Kurulumu

`SQLQuery1_Db_ve_tablelar.sql` ve `SQLQuery2_Veri_girisleri_ve_kontroller.sql`  dosyalarındaki verileri SQL Queryinize yapıştırarak `Hotel_Reservation` veritabanını ve verilerinizi oluşturabilirsiniz.

### 2. Sorguların Çalıştırılması

`SQLQuery_Sorgulama.sql` dosyasında örnek sorgular yer almaktadır. Bunları kullanarak veri üzerinde analiz yapabilir veya sistemin işleyişini test edebilirsiniz.

---

## 🤝 Katkı Sağlayın

Her katkı değerlidir! Fork'layın, geliştirin, pull request gönderin. İyileştirme önerileriniz varsa memnuniyetle bekliyorum.

---

## 📫 İletişim

Soru, öneri ya da geri bildirimleriniz için bana GitHub üzerinden ulaşabilirsiniz.
