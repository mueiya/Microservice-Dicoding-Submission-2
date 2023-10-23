#!/bin/bash

# 1. Perintah untuk membuat Docker image dari Dockerfile.
# Baris ini menggunakan perintah docker build untuk membuat Docker image 
# dari Dockerfile yang terdapat di direktori saat ini (.). 
# Image ini kemudian diberi tag mueiya/karsajobs:latest.
docker build -t mueiya/karsajobs:latest .

# 2. Login ke GitHub Packages
# karena (Personal Access Token) bersifat rahasia, 
# pastikan untuk menjalankan code dibawah untuk menyimpan PAT dalam ENV
# export GITHUB_PAT=personal_access_token
echo $GITHUB_PAT | docker login ghcr.io --username mueiya --password-stdin

# 3. Mengunggah image ke GitHub Packages (GitHub Container Registry)
docker push ghcr.io/mueiya/karsajobs:latest

# menggikuti saran ke 2 dengan menggunakan Github packages.