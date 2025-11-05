# vintage_sports

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Jawaban Pertanyaan

### 1 Perbedaan Navigator.push() vs Navigator.pushReplacement() dan penggunaannya di Football Shop

- `Navigator.push()` menambahkan halaman baru ke atas stack. Tombol back akan kembali ke halaman sebelumnya. Cocok untuk navigasi yang bersifat drill-down, misalnya dari Home ke halaman Form/Detail agar pengguna bisa kembali.
- `Navigator.pushReplacement()` mengganti halaman teratas dengan halaman baru. Tombol back tidak kembali ke halaman sebelumnya (karena sudah diganti). Cocok untuk transisi yang menyelesaikan alur, seperti selesai login atau selesai submit form.

Penggunaan di aplikasi:
- Gunakan `Navigator.push()` saat menekan kartu "Create Product" dari Home agar bisa kembali ke Home: lihat `vintage_sports/lib/menu.dart`.
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const NewsFormPage()),
  );
  ```
- Gunakan `Navigator.pushReplacement()` saat berpindah melalui Drawer untuk mengganti halaman aktif tanpa menumpuk banyak halaman: lihat `vintage_sports/lib/widgets/left_drawer.dart`.
  ```dart
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => MyHomePage()),
  );
  ```
- Alternatif: setelah form produk berhasil disimpan, bisa gunakan `pushReplacement` kembali ke Home agar pengguna tidak kembali ke form dan mengirim ulang.

### 2 Memanfaatkan Scaffold, AppBar, dan Drawer untuk struktur konsisten

- `Scaffold` menyediakan kerangka halaman (AppBar, Drawer, body, FloatingActionButton) sehingga semua halaman memiliki layout yang konsisten.
- `AppBar` menampilkan judul/aksi yang seragam; warna mengikuti tema aplikasi agar identitas visual konsisten.
- `Drawer` (melalui `LeftDrawer`) dipakai ulang di setiap halaman untuk navigasi yang konsisten.

Contoh (dipakai di banyak halaman, mis. `vintage_sports/lib/menu.dart` dan `vintage_sports/lib/newlist_form.dart`):
```dart
Scaffold(
  appBar: AppBar(title: const Text('Vintage Sports')),
  drawer: const LeftDrawer(),
  body: ...,
)
```

### 3 Kelebihan Padding, SingleChildScrollView, dan ListView untuk form + contoh di aplikasi

- `Padding`: memberi jarak antar elemen agar lebih mudah dibaca dan disentuh, penting untuk aksesibilitas form.
- `SingleChildScrollView`: mencegah overflow ketika form tinggi (terutama saat keyboard muncul) dengan memungkinkan konten digulir.
- `ListView`: efisien untuk daftar elemen yang panjang/berulang karena hanya merender yang terlihat; cocok untuk daftar produk atau input yang dinamis.

Contoh dari aplikasi:
- Pada form produk (`vintage_sports/lib/newlist_form.dart`), setiap `TextFormField` dibungkus `Padding`, dan seluruh isi dibungkus `SingleChildScrollView` agar tidak overflow:
  ```dart
  Form(
    child: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(labelText: 'Nama Produk'),
        ),
        // ... field lainnya
      ]),
    ),
  )
  ```
- Pada beranda (`vintage_sports/lib/menu.dart`), digunakan `GridView` dan `Padding` untuk tata letak yang rapi. Untuk daftar panjang, pola serupa dapat diganti ke `ListView.builder`.

### 4 Menyesuaikan warna tema agar konsisten dengan brand toko

- Atur palet warna global melalui `ThemeData` dan `ColorScheme` di `MaterialApp` (lihat `vintage_sports/lib/main.dart`). Gunakan warna brand (mis. biru tua/indigo) sebagai `primary` dan turunan untuk aksen.
  ```dart
  MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1A237E), // contoh: indigo brand
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A237E),
        foregroundColor: Colors.white,
      ),
    ),
  )
  ```
- Gunakan `Theme.of(context).colorScheme.primary` untuk AppBar/komponen utama agar konsisten, bukan hardcode warna. Contoh di `vintage_sports/lib/menu.dart` AppBar mengambil `colorScheme.primary`.
- Selaraskan komponen lain (Button, Switch, dan lain-lain) agar mengikuti tema, atau set `ElevatedButtonTheme`, `SwitchTheme`, dll., sehingga tampilan konsisten di seluruh halaman.
