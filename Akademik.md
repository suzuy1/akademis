Ringkasan Proyek: Aplikasi CRUD Akademik dengan Nuxt.js dan Supabase
Dokumen ini menjelaskan konsep, alur kerja, dan fitur utama dari aplikasi web untuk manajemen data akademik. Aplikasi ini akan dibangun menggunakan Nuxt.js (sebagai kerangka kerja Vue.js) untuk frontend dan Supabase sebagai backend (database, autentikasi, dan API).

1. Konsep Aplikasi
Aplikasi ini adalah sebuah Sistem Informasi Akademik (SIA) sederhana yang memungkinkan pengguna (seperti admin atau staf akademik) untuk mengelola data-data penting yang berkaitan dengan kegiatan akademik. Fungsi utamanya adalah CRUD (Create, Read, Update, Delete) untuk entitas-entitas berikut, sesuai dengan skema database yang ada:

Mahasiswa (Students)

Dosen (Lecturers)

Mata Kuliah (Courses)

Kelas (Classes)

Jadwal (Schedules)

Nilai (Grades)

2. Fitur-Fitur Utama
Fitur aplikasi akan dibagi berdasarkan entitas yang dikelola:

A. Manajemen Mahasiswa
Create: Menambahkan data mahasiswa baru (NIM, nama, jurusan, tahun, alamat, kelas).

Read: Menampilkan daftar semua mahasiswa dalam bentuk tabel yang mudah dibaca, lengkap dengan fitur pencarian dan filter. Pengguna juga dapat melihat halaman detail untuk setiap mahasiswa.

Update: Mengubah atau memperbarui informasi mahasiswa yang sudah ada.

Delete: Menghapus data mahasiswa dari sistem.

B. Manajemen Dosen
Create: Menambahkan data dosen baru (NIP, nama, departemen).

Read: Menampilkan daftar semua dosen.

Update: Memperbarui informasi dosen.

Delete: Menghapus data dosen.

C. Manajemen Mata Kuliah & Jadwal
Create: Membuat mata kuliah baru (kode, nama, SKS) dan menugaskan dosen pengampu. Membuat jadwal untuk setiap mata kuliah (hari, jam, ruangan).

Read: Menampilkan daftar semua mata kuliah beserta dosen dan jadwalnya.

Update: Mengubah detail mata kuliah atau jadwal.

Delete: Menghapus mata kuliah atau jadwal.

D. Pengelolaan Nilai
Create: Menginput dan menetapkan nilai (A, B, C, D, E) untuk seorang mahasiswa pada mata kuliah tertentu.

Read: Melihat rekam jejak nilai (transkrip) per mahasiswa.

Update: Memperbaiki atau mengubah nilai yang sudah diinput.

E. Autentikasi & Keamanan
Login Pengguna: Pengguna harus login untuk dapat mengakses fitur manajemen data.

Keamanan Berbasis Peran: Menggunakan Row Level Security (RLS) dari Supabase (seperti yang dicontohkan di file PDF) untuk membatasi akses data. Contoh: mahasiswa hanya bisa melihat nilainya sendiri, sedangkan admin bisa melihat semua data.

3. Alur Kerja Aplikasi (Application Flow)
Alur kerja aplikasi menjelaskan interaksi antara pengguna, frontend (Nuxt.js), dan backend (Supabase).

Inisialisasi & Setup:

Developer membuat proyek di Supabase.

Skema database dari file PDF dieksekusi di Supabase untuk membuat semua tabel (lecturers, students, courses, dll.) dan kebijakan RLS.

Akses Pengguna:

Pengguna membuka aplikasi web di browser.

Aplikasi (Nuxt.js) akan menampilkan halaman login.

Pengguna memasukkan kredensial dan melakukan login. Proses ini ditangani oleh Supabase Auth.

Menampilkan Data (Read):

Setelah login, pengguna diarahkan ke dashboard utama.

Misalnya, saat pengguna membuka halaman "Daftar Mahasiswa".

Aplikasi Nuxt.js akan membuat permintaan API (menggunakan library supabase-js) ke Supabase untuk mengambil data dari tabel students.

Supabase memeriksa identitas pengguna dan menerapkan kebijakan RLS sebelum mengirimkan data yang diizinkan.

Data yang diterima ditampilkan di antarmuka pengguna (UI) dalam bentuk tabel.

Membuat Data Baru (Create):

Pengguna mengklik tombol "Tambah Mahasiswa" dan mengisi formulir.

Setelah menekan "Simpan", aplikasi Nuxt.js mengirimkan data dari formulir ke Supabase.

Supabase memasukkan data tersebut sebagai baris baru di tabel students.

UI secara otomatis diperbarui untuk menampilkan data mahasiswa yang baru ditambahkan.

Memperbarui & Menghapus Data (Update & Delete):

Prosesnya mirip: pengguna berinteraksi dengan UI (misalnya, menekan tombol "Edit" atau "Hapus").

Aplikasi Nuxt.js mengirimkan permintaan UPDATE atau DELETE yang sesuai ke Supabase.

Supabase memproses permintaan tersebut, dan UI diperbarui untuk merefleksikan perubahan.

4. Peran Teknologi
Supabase (Backend-as-a-Service)

Database: Menyediakan database PostgreSQL untuk menyimpan semua data akademik.

API Otomatis: Secara otomatis membuat RESTful API di atas database Anda, sehingga frontend dapat berinteraksi dengan mudah tanpa perlu membuat API manual.

Autentikasi: Mengelola login, registrasi, dan sesi pengguna.

Keamanan: Menegakkan aturan akses data melalui Row Level Security.

Nuxt.js / Vue.js (Frontend)

Antarmuka Pengguna (UI): Membangun semua komponen visual yang dilihat dan digunakan oleh pengguna, seperti tabel, formulir, tombol, dan navigasi.

Manajemen State: Mengelola data di sisi klien (misalnya, menyimpan daftar mahasiswa yang sedang ditampilkan).

Interaksi API: Bertanggung jawab untuk berkomunikasi dengan API Supabase untuk mengirim dan menerima data.

Routing: Mengatur halaman-halaman aplikasi (misalnya, /mahasiswa, /dosen, /mata-kuliah).