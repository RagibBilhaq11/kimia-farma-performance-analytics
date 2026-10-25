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

## Penjelasan File SQL

| File | Penjelasan |
|---|---|
| `1_eksplorasi_data.sql` | Query untuk memeriksa kualitas data: jumlah baris, rentang tanggal, nilai NULL, dan kecocokan antar tabel. |
| `2_tabel_analisa.sql` | Query utama pembuatan `tabel_analisa` dengan JOIN tiga tabel dan perhitungan laba (CASE WHEN), nett sales, dan nett profit. |

## Dashboard

- Link dashboard: [https://datastudio.google.com/reporting/db418716-a7db-4ba6-b7dd-03723b9accb5]

## Insight Utama

### 1. Pendapatan tahunan stabil, tidak ada pertumbuhan
- Nett sales per tahun berada di kisaran Rp 80 miliar: sekitar 80,4M (2020), 80,0M (2021), 80,6M (2022), dan 80,1M (2023).
- Selisih tahun tertinggi dan terendah hanya sekitar 0,7%. Pendapatan praktis datar selama 4 tahun, dengan puncak di 2022.
- Artinya bisnis stabil tetapi belum tumbuh.

### 2. Penjualan sangat terkonsentrasi di Jawa Barat
- Jawa Barat menyumbang sekitar Rp 95 miliar nett sales dan Rp 26,9 miliar profit, atau sekitar 30% dari total perusahaan.
- Provinsi berikutnya jauh di bawahnya: Sumatera Utara dan Jawa Tengah (sekitar Rp 22-23 miliar), lalu Jawa Timur, Sulawesi Utara, dan Sumatera Barat (sekitar Rp 15-16 miliar).
- Top 10 provinsi: Jawa Barat, Sumatera Utara, Jawa Tengah, Jawa Timur, Sulawesi Utara, Sumatera Barat, Aceh, Nusa Tenggara Barat, Kalimantan Timur, Riau.

### 3. Margin tinggi karena didominasi obat berharga tinggi
- Margin 28,4% mendekati batas atas ketentuan laba (30%). Ini menandakan sebagian besar nilai penjualan datang dari obat berharga di atas Rp 300.000.
- Dengan rata-rata Rp 478 ribu per transaksi, penjualan bergantung pada produk bernilai tinggi.

### 4. Profit tersebar di beberapa kategori obat
- Lima kategori terbesar: R06 (20,3%), M01AE (18%), N05C (14,9%), N02BE/B (12,1%).
- Kategori lainnya ("Others") menyumbang 34,8%, jadi tidak ada satu kategori yang terlalu dominan.

### 5. Gap rating pada cabang unggulan
- Lima cabang rating tertinggi: Pematangsiantar (4,83), Jambi (4,77), Batam (4,73), Sorong (4,73), Cikampek (4,72).
- Rating transaksi kelimanya 3,99-4,02, atau sekitar 0,7-0,8 poin di bawah rating cabangnya, dan setara rata-rata keseluruhan (4,0).
- Tiga dari lima berformat Klinik-Apotek-Laboratorium dan empat dari lima berada di luar Jawa Barat. Dugaan awal: layanan yang lebih kompleks membuat pengalaman per transaksi kurang konsisten (perlu dikonfirmasi dengan data lain).

## Rekomendasi

1. **Kurangi ketergantungan pada Jawa Barat.** Satu provinsi menyumbang ±30% penjualan. Gali potensi provinsi nomor 2-5 (Sumatera Utara, Jawa Tengah, Jawa Timur) lewat tambahan cabang atau promosi, karena risiko bisnis tinggi bila Jawa Barat melemah.
2. **Cari sumber pertumbuhan karena pendapatan datar.** Evaluasi kampanye tahun 2022 (puncak) dan analisis apa yang membuatnya naik, lalu ulangi di tahun berikutnya.
3. **Jaga ketersediaan obat berharga tinggi.** Karena penjualan bergantung pada produk > Rp 300.000, pastikan stok kategori terbesar (R06, M01AE, N05C, N02BE/B) aman di provinsi dengan transaksi tinggi.
4. **Dorong provinsi dengan profit rendah.** Evaluasi provinsi di ujung bawah peta (profit mulai dari Rp 0,57 miliar) apakah masalahnya jumlah cabang, lokasi, atau ketersediaan produk.
