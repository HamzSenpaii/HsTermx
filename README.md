<p align="center">
  <img src="https://img.shields.io/badge/Shell-Bash-green?logo=gnu-bash">
  <img src="https://img.shields.io/badge/Platform-Termux%20%7C%20Linux-green" alt="Platform">
  <img src="https://img.shields.io/badge/License-Custom--By--HamzSenpaii-informational" alt="License">
</p>

<h1 align="center">📦 HsTermx</h1>
<p align="center"><i>Script ringan untuk mengubah tampilan Termux secara otomatis dan stylish.</i></p>

---

## 📌 Description of HsTermx

**HsTermx** adalah script otomatis untuk mempercantik tampilan Termux secara ringan, cepat, dan profesional.  
Script ini mengatur shell Zsh, menambahkan tema, font, warna, serta fetch info terminal agar tampil menarik dan tetap ringan.

Ideal untuk pengguna yang ingin tampil beda tanpa membebani performa.

---

## ✨ Features of HsTermx

- Mengganti tampilan Termux secara otomatis
- Menampilkan info sistem dengan `rxfetch`
- Menggunakan font modern: **Fira Code Bold Nerd Font**
- Mengaktifkan tema warna custom: **nekonako-djancoeg**
- Konfigurasi ZSH dengan tema manual `osx2.zsh-theme`
- Ringan, tidak menggunakan plugin ZSH tambahan

---

## 📁 Directory Structure

```text
HsTermx/
├── install.sh                        # Script utama instalasi otomatis
├── theme/osx2.zsh-theme              # Tema untuk ZSH
├── colors/nekonako-djancoeg.colors   # Tema warna untuk Termux
├── fonts/firacode-bold-nerd-font.ttf # Font yang digunakan
└── rxfetch/rxfetch                   # Info sistem terminal (fetch tools)
```

---

## ⚙️ Installation Guide

  <details open>
  <summary><strong>Installation HsTermx</strong></summary>
    <br>
    
- Update Repository & Upgrade Package
    
```bash
pkg update && pkg upgrade -y
```

- Instalation Git For Cloning Repository

```bash
pkg install git -y
```

- Clone Or Download Repository

```bash
git clone https://github.com/HamzSenpaii/HsTermx.git
```

- Move Folder

```bash
cd HsTermx
```

- Give Permission

```bash
chmod +x install.sh
```

- Execute Installer

```bash
./install.sh
```
  </details>

---

## 🧠 Credits & Notes

Script **HsTermx** dibuat oleh **HamzSenpaii**,
sebagai _rebuild ringan_ dari script original [MyTermux](https://github.com/mayTermux/myTermux).  
Ini **bukan hasil fork langsung**, melainkan hasil **pembuatan ulang dan modifikasi** dengan fokus utama pada kesederhanaan, efisiensi, dan pengurangan beban sistem.

### 💡 Inspirasi
- script **HsTermx** alternatif dari **MyTermux** dengan fokus pada performa yang ringan.
- Dikembangkan ulang agar lebih minimalist, ringan, dan mudah diinstal.

## 🙌 Thanks To

- **[HamzSenpaii](https://github.com/HamzSenpaii)** – Pembuat script **HsTermx**, yang merebuild script **MyTermux** agar lebih ringan dan minimalist.
- **[MyTermux](https://github.com/mayTermux/myTermux)** – Script original yang menjadi inspirasi utama pembuatan ulang.
- **[rxfetch](https://github.com/mayTermux/rxfetch-termux)** – Script sistem fetch minimalis yang digunakan untuk menampilkan informasi sistem.
- Kontributor tema dan font:
  - [`osx2.zsh-theme`](https://github.com/mayTermux/myTermux) – Tema ZSH bergaya macOS.
  - [`FiraCode Nerd Font`](https://github.com/mayTermux/myTermux) – Font terminal dengan ikon lengkap.
  - [`nekonako-djancoeg.colors`](https://github.com/mayTermux/myTermux) – Tema warna custom untuk kenyamanan visual.
- ❤️ Komunitas Termux & open-source – Untuk segala ilmu, alat, dan semangat kolaborasi.

---

## 📜 License

This project is licensed as **Custom License by HamzSenpaii**:

- You are allowed to use and rebuild this script for personal or educational purposes.
- You are **NOT allowed** to remove the original author attribution.
- You are **NOT allowed** to sell, redistribute, or reupload this project under a different name.
- For commercial usage or modification requests, please contact me.

© 2025 HamzSenpaii – All rights reserved.

---

<p align="center"><b>💙 Terima kasih telah menggunakan HsTermx</b></p>
