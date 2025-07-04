#!/data/data/com.termux/files/usr/bin/bash

# ========================================================
# HsTermx - Lightweight Termux Customization Script
# ========================================================
# Author        : HamzSenpaii
# Repository    : https://github.com/HamzSenpaii/HsTermx
# Description   : Script otomatis untuk mempercantik tampilan Termux
# Secara ringan dan stylish dengan ZSH, tema, dan fetch info.
#
# 🌟 Credits & Attribution
# --------------------------------------------------------
# HsTermx merupakan hasil pembuatan ulang (bukan fork langsung)
# dari script original bernama MyTermux:
# https://github.com/mayTermux/myTermux
#
# Script ini ditulis ulang dengan tujuan agar lebih ringan,
# Sederhana, dan mudah digunakan tanpa mengurangi estetika.
#
# Tools & sumber eksternal yang digunakan:
# - rxfetch                      : https://github.com/mayTermux/rxfetch-termux
# - osx2.zsh-theme               : Tema ZSH bergaya macOS (dari MyTermux)
# - nekonako-djancoeg.colors     : Tema warna terminal (dari MyTermux)
# - Fira Code Bold Nerd Font     : Font modern (dari MyTermux)
#
# ⚠️ Catatan:
# Hingga saat ini, pembuat script MyTermux (mayTermux) tidak
# mencantumkan nama developer asli. Kredit tetap ditujukan kepada
# mereka sebagai bentuk penghargaan dan penghormatan atas karya
# yang menjadi inspirasi HsTermx ini.
#
# 💬 Lisensi
# Script ini bebas digunakan, dimodifikasi, dan dibagikan kembali
# selama tetap mencantumkan kredit kepada pembuat HsTermx dan sumber
# proyek inspirasi (MyTermux & tools terkait).
# ========================================================

clear
set -e

# -------------------------
# Warna untuk output log
# -------------------------
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # Reset warna

# Direktori dasar (lokasi script)
BASE_DIR="$(dirname "$(realpath "$0")")"

# -------------------------
# Fungsi log
# -------------------------
info()    { printf "${YELLOW}%-60s${NC}\n" "[HsTermx] $1..."; }
success() { printf "${GREEN}%-60s [DONE]${NC}\n" "[HsTermx] $1"; }
error()   { printf "${RED}%-60s [ERROR]${NC}\n" "[HsTermx] $1"; }

# -------------------------
# Update & upgrade paket
# -------------------------
info "Memperbarui paket"
pkg update -y >/dev/null 2>&1 && pkg upgrade -y >/dev/null 2>&1 \
  && success "Paket diperbarui" || error "Gagal memperbarui paket"

# -------------------------
# Instalasi tools penting
# -------------------------
info "Menginstal Zsh, Git, Curl, Wget"
pkg install -y zsh git curl wget >/dev/null 2>&1 \
  && success "Zsh & tools terinstal" || error "Gagal menginstal tools"

# -------------------------
# Clone Oh My Zsh jika belum ada
# -------------------------
info "Mengunduh Oh My Zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" >/dev/null 2>&1 \
    && success "Oh My Zsh diunduh" || error "Gagal clone Oh My Zsh"
else
  success "Oh My Zsh sudah ada, dilewati"
fi

# -------------------------
# Menyalin template .zshrc bawaan
# -------------------------
info "Menyalin template .zshrc"
cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" "$HOME/.zshrc" \
  && success ".zshrc disiapkan" || error "Gagal menyalin .zshrc"

# -------------------------
# Prompt untuk ubah shell default
# -------------------------
echo -ne "${YELLOW}[HsTermx] Ingin mengatur shell default ke zsh? [Y/n]: ${NC}"
read -r change_shell
if [[ "$change_shell" =~ ^[Yy]$ || -z "$change_shell" ]]; then
  chsh -s zsh >/dev/null 2>&1 \
    && success "Shell default diubah ke Zsh" || error "Gagal mengubah shell default"
else
  info "Shell default tidak diubah"
fi

# -------------------------
# Menyalin tema osx2 ke custom theme
# -------------------------
info "Menyalin tema osx2"
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
cp "$BASE_DIR/theme/osx2.zsh-theme" "$HOME/.oh-my-zsh/custom/themes/" \
  && success "Tema osx2 disalin" || error "Gagal menyalin tema"

# -------------------------
# Mengatur tema osx2 di .zshrc
# -------------------------
info "Mengatur ZSH_THEME di .zshrc"
if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
  sed -i 's/^ZSH_THEME=.*/ZSH_THEME="osx2"/' "$HOME/.zshrc"
else
  echo 'ZSH_THEME="osx2"' >> "$HOME/.zshrc"
fi
success "Tema ZSH diatur"

# -------------------------
# Menyalin rxfetch ke ~/.local/bin/
# -------------------------
info "Menyalin rxfetch"
mkdir -p "$HOME/.local/bin"
cp "$BASE_DIR/rxfetch/rxfetch" "$HOME/.local/bin/rxfetch"
chmod +x "$HOME/.local/bin/rxfetch" \
  && success "rxfetch siap digunakan" || error "Gagal menyalin rxfetch"

# -------------------------
# Menambahkan rxfetch ke awal .zshrc
# -------------------------
info "Menambahkan rxfetch ke awal .zshrc"
if ! grep -q "rxfetch" "$HOME/.zshrc"; then
  sed -i '1i[ -f $HOME/.local/bin/rxfetch ] \&\& $HOME/.local/bin/rxfetch\n' "$HOME/.zshrc"
  success "rxfetch ditambahkan ke .zshrc"
else
  success "rxfetch sudah ada di .zshrc"
fi

# -------------------------
# Menyembunyikan banner default Termux
# -------------------------
info "Menyembunyikan banner default Termux"
touch "$HOME/.hushlogin" && success "Banner disembunyikan"

# -------------------------
# Menyalin font dan tema warna ke ~/.termux/
# -------------------------
info "Menyalin font dan tema warna Termux"
mkdir -p "$HOME/.termux"
cp "$BASE_DIR/fonts/firacode-bold-nerd-font.ttf" "$HOME/.termux/font.ttf"
cp "$BASE_DIR/colors/nekonako-djancoeg.colors" "$HOME/.termux/colors.properties" \
  && success "Font & tema warna disalin" || error "Gagal menyalin tema"

# -------------------------
# Reload pengaturan Termux
# -------------------------
info "Reload pengaturan Termux"
termux-reload-settings >/dev/null 2>&1 \
  && success "Pengaturan Termux diterapkan" || error "termux-reload-settings tidak tersedia"

# -------------------------
# Ulangi set default shell (jaga-jaga jika sebelumnya gagal)
# -------------------------
info "Mengatur shell default ke Zsh dengan chsh"
chsh -s zsh \
  && success "Shell default diatur ke Zsh" || error "Gagal mengatur shell default"

# -------------------------
# Pesan selesai
# -------------------------
success "Instalasi selesai! Ketik 'exit' lalu buka ulang Termux."