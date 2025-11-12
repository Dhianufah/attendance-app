# attendance_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

NOTES:

kISWeb adalah sebuah konstanta dalam kerangka kerja (framework) Flutter yang bernilai true jika aplikasi sedang dikompilasi atau dijalankan di platform web. Ini adalah alat bantu yang memungkinkan developer untuk menulis logika kode yang bisa mendeteksi apakah aplikasi tersebut berjalan di browser web atau tidak, sehingga dapat memberikan perilaku atau tampilan yang spesifik untuk platform tersebut. 

kISweb hanya berguna untuk IOS atau Android

Ascending yaitu dari A-Z kek bisa dibilang kalo ascending tuh dia yang pertama masuk yang keluar terakhir 
Descending yaitu dari Z-A kalo Descending itu kek yang masuk A tapi yang keluar z duluan
Array dalah kumpulan data dan kalo mau di akses pake index di dalam nya

Ascending : A-Z (yang pertama daftar pertama muncul)
Descanding : Z-A (yang pertama daftar terakhir muncul)
Arrays : dia akan diakses berdasarkan index

Fungsi Library : 
Intl : Buat setting waktu biar formatnya lebih rapi
Image_Picker : Biar bisa kamera (bisa pilih dari kamera dan galeri)
Firebase_Core : ini basic dependencies (wajib) kalo mau connect project ke firebase
Firebase_auth : buat autentificasi (login/register)
Cloud firestore : buat simpan data (foto, check in/checkout)
Firebase_database : (satu kesatuan sama cloud firestore)
Permission_handler : izin kalau aplikasi kita pakai hardware
Flutter_image_compress : untuk mengkompres image agar ukurannya tidak terlalu besar/berat



ini buat naro di realtime database bagian rulesnya
{
  "rules": {
    "attendance_photos": {
      "$uid": {
        ".read": "auth != null && auth.uid == $uid",
        ".write": "auth != null && auth.uid == $uid"
      }
    }
  }
}

ini buat taro di database bagian rules juga
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {

    // This rule allows anyone with your Firestore database reference to view, edit,
    // and delete all data in your Firestore database. It is useful for getting
    // started, but it is configured to expire after 30 days because it
    // leaves your app open to attackers. At that time, all client
    // requests to your Firestore database will be denied.
    //
    // Make sure to write security rules for your app before that time, or else
    // all client requests to your Firestore database will be denied until you Update
    // your rules
    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2025, 12, 10);
    }
  }
}