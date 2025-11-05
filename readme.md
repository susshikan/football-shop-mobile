# Vintage Sports (TUGAS INDIVIDU PBP)

<details>
    <summary><h2>Tugas Individu 7</h2></summary>

## Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah struktur hierarki yang merepresentasikan bagaimana semua widget tersusun di dalam aplikasi Flutter. Setiap elemen dalam aplikasi adalah widget, dan mereka tersusun seperti pohon di mana widget di dalam widget lain disebut child, sedangkan widget yang membungkusnya disebut parent.
Contohnya
- **MaterialApp** -> parent dari **MyHomePage**

## Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
| **Widget** | **Fungsi** |
|-------------|-------------|
| MaterialApp | Sebagai root widget aplikasi, menyediakan tema, navigasi, dan konfigurasi global. |
| Scaffold | Menyediakan struktur dasar halaman (AppBar, body, floating button, dsb) |
| AppBar | Menampilkan judul “Vintage Sports” di bagian atas aplikasi |
| Padding | Memberikan jarak di sekitar konten body |
| Column | Menyusun widget secara vertikal (misalnya Row, Center, Text, GridView) |
| InfoCard | Widget kustom yang menampilkan informasi (NPM, Nama, Kelas) |
| Card | Menampilkan konten dengan tampilan kartu dan efek bayangan |
| ItemCard | Widget kustom yang berisi ikon dan teks interaktif | 
| Material | Memberikan efek material | 
| SnackBar | Menampilkan notifikasi bawah ketika kartu ditekan |
| Icon | Menampilkan ikon pada kartu item |


## Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi sebagai akar (root) dari aplikasi Flutter yang menggunakan desain Material Design. Widget ini menyediakan konfigurasi global seperti tema warna (ThemeData), judul aplikasi, sistem navigasi antar halaman, serta pengaturan tampilan default seperti font dan efek transisi. Dengan menempatkan MaterialApp di level paling atas, seluruh widget di bawahnya otomatis mewarisi gaya dan aturan yang ditentukan, sehingga tampilan aplikasi menjadi konsisten dan mudah dikelola.
- Contohnya pada projek saya
    ``` dart
    return MaterialApp(
    title: 'Vintage Sports',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
    ),
    home: MyHomePage()
    );

    ``` 

## Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget dan StatefulWidget merupakan dua jenis widget utama di Flutter yang berbeda pada kemampuannya dalam mengelola data. StatelessWidget bersifat statis, artinya tampilan dan datanya tidak dapat berubah setelah dibuat; widget ini cocok untuk elemen yang hanya menampilkan informasi tetap seperti teks atau ikon. Sementara itu, StatefulWidget memiliki state (keadaan) yang dapat berubah selama aplikasi berjalan, sehingga cocok digunakan untuk elemen interaktif seperti tombol yang menghitung klik, form input, atau animasi yang bergerak dinamis. Dengan kata lain, jika tampilan bergantung pada data yang bisa berubah, gunakan StatefulWidget; jika tidak, StatelessWidget sudah cukup.

## Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree Flutter, dan berfungsi sebagai penghubung antara widget dengan elemen-elemen lain dalam hirarki tampilan. Objek ini penting karena memungkinkan widget untuk berinteraksi dengan lingkungan sekitarnya, seperti mengakses tema aplikasi (Theme.of(context)), menampilkan pesan menggunakan ScaffoldMessenger.of(context), atau melakukan navigasi dengan Navigator.of(context). Setiap kali metode build() dipanggil, BuildContext dikirimkan agar widget dapat membangun tampilan berdasarkan konteks tempat ia berada dalam struktur aplikasi.
- Contohnya pada proyek saya
    ``` dart
    ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
    );
    ```

## Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Perbedaan utama antara Hot Reload dan Hot Restart di Flutter terletak pada cara keduanya memperbarui aplikasi saat pengembang melakukan perubahan kode. Hot Reload hanya memuat ulang kode yang diubah tanpa menghentikan aplikasi, sehingga tampilan langsung diperbarui dan state (keadaan data) tetap dipertahankan — cocok untuk mengubah UI atau logika kecil secara cepat. Sebaliknya, Hot Restart menjalankan ulang seluruh aplikasi dari awal, menghapus semua state yang tersimpan, dan memulai kembali dari fungsi main(), sehingga cocok digunakan ketika terjadi perubahan besar yang memengaruhi struktur awal atau data aplikasi.

</details>

<details>
    <summary><h2>Tugas Individu 8</h2></summary>

## 1 Perbedaan Navigator.push() vs Navigator.pushReplacement() dan penggunaannya di Football Shop

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

## 2 Memanfaatkan Scaffold, AppBar, dan Drawer untuk struktur konsisten

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

## 3 Kelebihan Padding, SingleChildScrollView, dan ListView untuk form + contoh di aplikasi

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

## 4 Menyesuaikan warna tema agar konsisten dengan brand toko

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

</details>



