-- Tabel Analisa Kimia Farma 2020-2023
CREATE OR REPLACE TABLE `rakamin-kf-analytics-510903.kimia_farma.tabel_analisa` AS
WITH base AS (
  SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    k.branch_name,
    k.kota,
    k.provinsi,
    k.rating AS rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    p.product_category,            
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi
  FROM `rakamin-kf-analytics-510903.kimia_farma.kf_final_transaction` t
  LEFT JOIN `rakamin-kf-analytics-510903.kimia_farma.kf_kantor_cabang` k
    ON t.branch_id = k.branch_id
  LEFT JOIN `rakamin-kf-analytics-510903.kimia_farma.kf_product` p
    ON t.product_id = p.product_id
),
laba AS (
  SELECT
    *,
    -- Persentase laba sesuai ketentuan harga (dalam bentuk desimal: 0.10 = 10%)
    CASE
      WHEN actual_price <= 50000  THEN 0.10
      WHEN actual_price <= 100000 THEN 0.15
      WHEN actual_price <= 300000 THEN 0.20
      WHEN actual_price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba
  FROM base
)
SELECT
  transaction_id,
  date,
  branch_id,
  branch_name,
  kota,
  provinsi,
  rating_cabang,
  customer_name,
  product_id,
  product_name,
  product_category,
  actual_price,
  discount_percentage,
  persentase_gross_laba,
  -- Harga setelah diskon
  actual_price * (1 - discount_percentage) AS nett_sales,
  -- Keuntungan = penjualan bersih x persentase laba
  actual_price * (1 - discount_percentage) * persentase_gross_laba AS nett_profit,
  rating_transaksi
FROM laba;
