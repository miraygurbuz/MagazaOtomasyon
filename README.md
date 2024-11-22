# Mağaza Otomasyon
 Veritabanı Yönetim Sistemleri dersi için hazırladığımız web tabanlı proje.
 ## Kullanılan Araç ve Teknolojiler 
- **Geliştirme ortamları:** Visual Studio Community 2022, Microsoft SQL Server Management Studio
- **Kullanılan diller:** C#, JavaScript, HTML, CSS, SQL
- **Kullanılan frameworkler:** ASP.NET, Bootstrap
- **Veritabanı yönetimi:** Microsoft SQL Server 

## Özet
Bu projede giyim mağazalarının günlük işlemlerini daha kolay ve verimli şekilde yönetebilmesi amaçlanarak web tabanlı bir otomasyon sistemi oluşturulmuştur. Projenin veritabanı 9 tablo ve bu tablolar arasında 7 ilişki içermektedir. INDEX, TRIGGER ve VIEW kullanılarak veritabanı işlevselliği artırılmıştır.

### Admin ve Kullanıcı Arayüzleri

**Admin arayüzünde:**
- Mağazadaki ürünler listelenebilir, yeni ürün eklenebilir, bu ürünlerin bilgileri güncellenebilir, ürünlerin kullanıcı arayüzündeki görünürlüğü (satış durumu) değiştirilebilir.

- Mağazadaki ürün satışlarını, tedarikleri ve müşteri siparişlerini listelemek, el ile yeni satış ya da tedarik girmek ve bu işlemlerin ardından mağazanın gelir gider durumunu takip etmek mümkündür. Aynı zamanda satış, tedarik veya müşteri siparişi sonrasında ürünlerin stok durumu gözlemlenebilir.

- Admin, mağazada kayıtlı olan marka ve ürün kategorilerini görüntüleyebilir, güncelleyebilir ve mağazaya yeni marka veya ürün kategorisi ekleyebilir. Mağaza sistemine kayıt olmuş kullanıcıların bilgilerini listeleyebilir.

**Kullanıcı arayüzünde:**
- Kullanıcı sisteme kayıt olup giriş yapabilir. 

- Giriş yapmamış kullanıcı satışta olan ürün listesini görüntüleyebilir, istediği marka ve kategoriye göre filtrelenmiş sonuçları alabilir. İlgili ürünün detaylarını görüntüleyebilir.

- Giriş yapan kullanıcı, giriş yapmamış kullanıcının yaptığı tüm işlemleri yapabilir. Ek olarak sipariş verebilir. 

### Alınan Güvenlik Önlemleri
- Kullanıcının oluşturduğu şifre veritabanında güvenlik amaçlı hashlenerek saklanır.

- Admin arayüzüne yalnızca admin erişebilir. Kullanıcı erişimi engellenmiştir.

## Arayüzden Birkaç Görsel
### Kullanıcı Arayüzü Ürün Listeleme Sayfası
![327831102-cc52d7bb-acb4-40cc-991b-f2f1743a6470](https://github.com/miraygurbuz/MagazaOtomasyon/assets/161487392/5fa85eac-f025-4c41-8880-e400ba158dd4)
### Admin Arayüzü Ana Sayfa
![327831127-48220779-a197-4258-9bc3-ca81d47fc891](https://github.com/miraygurbuz/MagazaOtomasyon/assets/161487392/77dcdc29-7f8b-4402-9121-95d6add1039b)
### Admin Arayüzü Ürün İşlemleri Sayfası
![327831138-4e512725-fa68-4ef5-888b-c0897574e43b-1](https://github.com/miraygurbuz/MagazaOtomasyon/assets/161487392/e273a641-62ba-41fd-9666-97a14d2b95ff)

