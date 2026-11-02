# Taşınabilir veri modeli

Kök belge `BusinessOSState` biçimindedir:

```json
{
  "schemaVersion": 1,
  "tenantId": "copy-uuid",
  "settings": { "businessName": "Örnek İşletme", "currency": "TRY" },
  "transactions": [{
    "id": "uuid", "tenantId": "copy-uuid", "type": "income",
    "date": "2026-11-02", "description": "Ürün satışı",
    "category": "Satış", "amountMinor": 250000, "customerId": null
  }],
  "customers": [{
    "id": "uuid", "tenantId": "copy-uuid", "name": "Ayşe Yılmaz",
    "phone": "", "email": ""
  }],
  "receivables": [{
    "id": "uuid", "tenantId": "copy-uuid", "customerId": "uuid",
    "description": "Hizmet", "dueDate": "2026-11-30",
    "amountMinor": 127500, "status": "pending"
  }]
}
```

`amountMinor` para biriminin en küçük birimidir; TRY için 1250.50 TL, `125050` olarak saklanır. Böylece kayan nokta hataları azaltılır. `schemaVersion` ileride migration yazabilmek için zorunludur.

## İlişkiler

- `transactions.customerId` opsiyonel olarak `customers.id` değerine bağlanır.
- `receivables.customerId`, `customers.id` değerine bağlanır.
- Tüm kayıtlar `tenantId` taşır; SaaS sorguları bunu zorunlu filtreler.
