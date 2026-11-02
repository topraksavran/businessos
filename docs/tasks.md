# İlk geliştirme görev planı

## Faz 0 — doğrulama

1. Prototipi 5 küçük işletme sahibine göster.
2. En çok kullanılan üç kayıt türünü ve beklenen raporları not et.
3. En az iki kişiden ödeme niyeti veya ön sipariş sinyali al.

## Faz 1 — çalışan indirilebilir MVP — tamamlandı

1. Statik uygulama kabuğu ve responsive navigasyon.
2. `BusinessOSState` şeması, tenant kimliği ve schema version.
3. localStorage repository ve demo veri üretimi.
4. Gelir/gider formu, doğrulama, liste ve silme.
5. Müşteri formu ve müşteri listesi.
6. Tahsilat formu ve pending/paid durumları.
7. KPI hesapları ve aylık özet.
8. Ayarlar, veri sıfırlama ve güvenli demo yenileme.
9. JSON export/import ve basit CSV export. ✅
10. Mobil görünüm, boş durumlar ve hata mesajları. ✅

### Teslim kontrolü

- [x] Tek dosya/kopya olarak çalıştırılabilir
- [x] Tenant kimliği ve schema version mevcut
- [x] Gelir/gider, müşteri, tahsilat ve ayarlar çalışıyor
- [x] JSON yedekleme ve geri yükleme çalışıyor
- [x] İşlemler CSV olarak dışa aktarılabiliyor
- [x] Pozitif tutar ve zorunlu alan doğrulaması var
- [x] Mobil kırılımlar ve boş durumlar var
- [x] JavaScript sözdizimi kontrol edildi

## Faz 2 — satışa hazırlık

1. Kurulum rehberi ve örnek veri temizleme yönergesi.
2. Lisans/teslimat sayfası ve ürün kullanım sınırları.
3. Kullanıcı testleri: ilk kayıt 2 dakikadan kısa mı?
4. Veri yedekleme uyarıları ve sürümleme.

## Faz 3 — SaaS keşfi

1. Auth ve workspace/tenant tabloları.
2. Repository adaptörünü REST/Supabase'e taşı.
3. API tarafında tenant authorization.
4. Kullanıcı daveti, roller ve audit log.
