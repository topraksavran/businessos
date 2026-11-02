# BusinessOS MVP

BusinessOS, küçük işletmeler için indirilebilir/kopyalanabilir işletme yönetim panelidir.

## MVP kararları

- Dağıtım: statik web uygulaması; kurulum sunucusu gerekmez.
- Veri: tarayıcı `localStorage`; her kopya ve tarayıcı profili izole çalışır.
- Teknoloji: vanilla HTML/CSS/JavaScript. Build aracı ve abonelik maliyeti yok.
- Kapsam: özet paneli, gelir/gider kayıtları, müşteriler, tahsilatlar, ayarlar.
- Para: kuruş hassasiyetini korumak için tutarlar integer kuruş olarak saklanır.
- Gelecek: repository katmanı ve tenant kimliği sayesinde SaaS API'sine taşınabilir.

## Çalıştırma

`index.html` dosyasını doğrudan açabilir veya herhangi bir statik sunucuyla yayınlayabilirsiniz. Örneğin:

```bash
python3 -m http.server 8080
```

Sonra `http://localhost:8080` adresini açın.

## Kullanım akışı

1. **Demo verisi** ile örnek paneli inceleyin veya boş başlayın.
2. **Ayarlar** bölümünden işletme adını ve para birimini değiştirin.
3. Gelir/gider, müşteri ve tahsilat kayıtlarını ekleyin.
4. Düzenli olarak **JSON indir** ile tam yedek, **CSV indir** ile işlemler dışa aktarın.

Bu ürün tarayıcı verisini kullanır. Tarayıcı verileri temizlenirse kayıtlar kaybolabilir; satış teslimatında JSON yedeği alma adımı özellikle anlatılmalıdır.

## Üretim öncesi

İlk 5 potansiyel müşteriye prototipi gösterin. Özellikle veri kaybı beklentisi, rapor ihtiyacı ve ödeme isteğini ölçün. Gerçek finansal kayıtlar için yedekleme/export özelliği eklenmeden ürünü “muhasebe yazılımı” olarak konumlandırmayın.

Belgeler: [Mimari](docs/architecture.md), [Veri modeli](docs/data-model.md), [İlk görev planı](docs/tasks.md).
