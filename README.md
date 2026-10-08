# Kimia Farma Performance Analytics 2020-2023

Analisis kinerja bisnis Kimia Farma tahun 2020-2023 menggunakan **BigQuery** dan **Looker Studio**.
Project ini merupakan final task Project-Based Internship (Big Data Analytics) dari Rakamin Academy x Kimia Farma.

**Dibuat oleh:** Muhammad Ragib Bilhaq

## Deskripsi Project

Tujuan project ini adalah mengevaluasi kinerja bisnis Kimia Farma melalui data transaksi, cabang, produk, dan inventory.
Hasilnya berupa tabel analisa di BigQuery dan dashboard interaktif di Looker Studio yang menampilkan:

- Ringkasan kinerja (nett sales, nett profit, jumlah transaksi, rating)
- Perbandingan pendapatan dari tahun ke tahun
- Top 10 provinsi berdasarkan jumlah transaksi dan nett sales
- Top 5 cabang dengan rating cabang tertinggi namun rating transaksi terendah
- Peta profit per provinsi di Indonesia

## Tools

- Google BigQuery (SQL)
- Google Looker Studio
- GitHub

## Alur Pengerjaan

1. **Persiapan:** membuat project `Rakamin_KF_Analytics` dan dataset `kimia_farma` di BigQuery.
2. **Import data:** mengimpor 4 file CSV menjadi tabel di BigQuery.
3. **Eksplorasi data:** mengecek jumlah baris, rentang tanggal, nilai kosong, dan format kolom diskon.
4. **Membuat tabel analisa:** menggabungkan (JOIN) tabel transaksi, cabang, dan produk, lalu menghitung `persentase_gross_laba`, `nett_sales`, dan `nett_profit`.
5. **Membuat dashboard:** menghubungkan `tabel_analisa` ke Looker Studio dan membuat visualisasi.
6. **Analisis & rekomendasi:** merangkum insight dan saran bisnis dari dashboard.
