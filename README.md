<div align="center">

# Sistem Informasi Peminjaman Alat

**Uji Kompetensi Keahlian (UKK) — Rekayasa Perangkat Lunak (RPL)**  
Paket 1: Aplikasi Manajemen Inventaris & Peminjaman Alat Berbasis Web

<p>
  <img src="https://img.shields.io/badge/Laravel-12.72-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel" />
  <img src="https://img.shields.io/badge/Filament-v4-FDAE4B?style=for-the-badge&logo=php&logoColor=black" alt="Filament" />
  <img src="https://img.shields.io/badge/PHP-8.3-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/Livewire-Reactive_UI-FB70A9?style=for-the-badge&logo=livewire&logoColor=white" alt="Livewire" />
</p>

</div>

---

## Profil Pengembang

| Informasi | Detail |
| :--- | :--- |
| **Nama** | MUH. FEBRYANT HIDAYATULLAH |
| **Kelas** | XII RPL 3 |
| **Kompetensi Keahlian** | Rekayasa Perangkat Lunak (RPL) |
| **Judul Proyek** | Aplikasi Sistem Informasi Peminjaman Alat |

---

## Tentang Aplikasi

Aplikasi **Sistem Informasi Peminjaman Alat** merupakan proyek **Uji Kompetensi Keahlian (UKK) RPL** yang dibangun menggunakan framework **Laravel 12** dan **Filament Admin Panel**. Sistem ini dirancang untuk mendigitalisasi pengelolaan inventaris alat, pencatatan pengajuan peminjaman, verifikasi persetujuan oleh petugas, pemantauan pengembalian beserta denda keterlambatan, hingga pencetakan laporan transaksi secara terstruktur.

---

## Pembagian Hak Akses (Role)

| Role | Hak Akses & Wewenang |
| :--- | :--- |
| **Admin** | Akses penuh (CRUD) terhadap data **Users**, **Categories**, **Tools**, **Loans**, dan **Activity Logs**, memantau dashboard, serta mencetak laporan. |
| **Petugas** | Melihat daftar inventaris **Tools** (read-only), memproses persetujuan atau penolakan pengajuan peminjaman (**Setujui / Tolak**), memproses pengembalian alat, serta mencetak laporan. |
| **Peminjam** | Melihat daftar alat yang tersedia, mengajukan peminjaman baru, dan memantau status transaksi peminjaman. |

---

## Alur Kerja Sistem

```mermaid
flowchart LR
    A[Peminjam Mengajukan Pinjaman] --> B{Verifikasi Petugas}
    B -->|Setujui| C[Status: Dipinjam & Stok Berkurang]
    B -->|Tolak| D[Status: Ditolak & Stok Tetap]
    C --> E[Log Aktivitas Tercatat]
    D --> E
    C --> F[Pengembalian Alat]
    F --> G[Stok Kembali & Hitung Denda]
    G --> H[Cetak Laporan Peminjaman]
