-- 1. Lihat isi tiap tabel
SELECT * FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-510903.kimia_farma.kf_kantor_cabang` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-510903.kimia_farma.kf_product` LIMIT 10;
SELECT * FROM `rakamin-kf-analytics-510903.kimia_farma.kf_inventory` LIMIT 10;

-- 2. Jumlah baris & rentang tanggal transaksi
SELECT COUNT(*) AS total_baris,
       COUNT(DISTINCT transaction_id) AS transaksi_unik,
       MIN(date) AS tanggal_awal,
       MAX(date) AS tanggal_akhir
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction`;

-- 3. Cek format discount_percentage (0-1 atau 0-100?)
SELECT MIN(discount_percentage) AS min_diskon,
       MAX(discount_percentage) AS max_diskon
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction`;

-- 4. Cek nilai kosong (NULL)
SELECT
  COUNTIF(branch_id IS NULL) AS branch_null,
  COUNTIF(product_id IS NULL) AS product_null,
  COUNTIF(price IS NULL) AS price_null,
  COUNTIF(rating IS NULL) AS rating_null
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction`;

-- 5. Cek apakah ada transaksi yang tidak punya pasangan di tabel cabang/produk
SELECT COUNT(*) AS tanpa_cabang
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction` t
LEFT JOIN `rakamin-kf-analytics-510903.kimia_farma.kf_kantor_cabang` k ON t.branch_id = k.branch_id
WHERE k.branch_id IS NULL;

SELECT COUNT(*) AS tanpa_produk
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction` t
LEFT JOIN `rakamin-kf-analytics-510903.kimia_farma.kf_product` p ON t.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 6. Cek harga di transaksi apakah sama dengan harga di tabel produk
SELECT COUNT(*) AS harga_beda
FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction` t
JOIN `rakamin-kf-analytics-510903.kimia_farma.kf_product` p ON t.product_id = p.product_id
WHERE t.price != p.price;
