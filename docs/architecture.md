# BusinessOS teknik mimari

## Varsayımlar

İlk ürün tek işletme tarafından indirilecek, kopyalanacak ve çalıştırılacak. Başlangıçta hesap açma, sunucu, ödeme altyapısı ve çok kullanıcılı erişim gerekmiyor. Buna karşılık veri modeli daha sonra merkezi SaaS'a taşınırken yeniden yazılmamalı.

## MVP sınırı

### Dahil

- Ana panel: toplam gelir, toplam gider, net sonuç, bekleyen tahsilat.
- İşlemler: gelir/gider ekleme, listeleme ve silme.
- Müşteriler: müşteri ekleme ve listeleme.
- Tahsilatlar: müşteri, tutar, vade ve durum.
- Ayarlar: işletme adı ve para birimi.
- Demo veriyle ilk açılış ve sıfırlama.

### Şimdilik hariç

Randevu takvimi, stok, fatura/e-arşiv, banka entegrasyonu, ekip rolleri, otomatik bildirim, vergi/muhasebe mevzuatı, gerçek zamanlı senkronizasyon ve yapay zekâ asistanı.

## Katmanlar

1. **UI:** `index.html`, `styles.css`, `app.js` içindeki sayfa bölümleri.
2. **Domain:** KPI hesapları ve form doğrulama fonksiyonları.
3. **Repository:** Şimdilik `localStorage`; ileride aynı arayüzü kullanan REST/Supabase adaptörü.
4. **Tenant sınırı:** `tenantId` her kayıtta bulunur. İlk sürümde tenant, bir ürün kopyasının sabit kimliğidir; SaaS'ta oturumdaki workspace kimliğiyle değiştirilir.

## SaaS'a geçiş yolu

```text
localStorage repository
        ↓ aynı domain fonksiyonları
REST/Supabase repository
        ↓ tenantId + userId authorization
Postgres / managed database
```

Taşınabilirlik için UI doğrudan depolama anahtarına erişmez; `loadState`, `saveState`, `resetState` fonksiyonları tek giriş noktasıdır.

## Güvenlik ve veri beklentisi

Bu sürüm hassas finansal veri için yedekleme ve erişim kontrolü sağlamaz. Satış paketine JSON/CSV export, import ve otomatik yedekleme eklenmesi gerekir. SaaS sürümünde tenant filtresi yalnızca arayüzde değil, API ve veritabanı katmanında zorunlu olmalıdır.
