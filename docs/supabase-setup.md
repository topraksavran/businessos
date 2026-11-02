# Supabase kurulumu

1. Supabase’te yeni bir proje oluşturun.
2. `supabase-schema.sql` içeriğini SQL Editor’da çalıştırın.
3. `supabase-config.example.js` dosyasını `supabase-config.js` adıyla kopyalayın.
4. Project Settings > API bölümündeki Project URL ve anon public key değerlerini bu dosyaya yazın.
5. `index.html` dosyasını bir web sunucusuyla açın. Login ekranı görünür.
6. Kayıt olup e-posta doğrulama ayarlarını kontrol edin.

`anon` anahtarı frontend’de kullanılabilir; service-role anahtarını hiçbir zaman frontend’e koymayın.

## Bulut senkronizasyonunu etkinleştirme

Şema dosyasını daha önce çalıştırdıysanız yeni policy satırlarını da SQL Editor’da tekrar çalıştırın. Giriş yaptıktan sonra uygulamada yeni bir gelir, müşteri veya tahsilat kaydedin. Supabase Table Editor’da ilgili workspace altında kayıt görünmelidir. İlk sürümde yerel kopya yedek olarak tutulur; uygulama kaydetme işleminden sonra buluta da yazar.

Bu ilk adım login katmanını hazırlar. İşletme kayıtlarının localStorage yerine Supabase tablolarına taşınması bir sonraki adımdır.
