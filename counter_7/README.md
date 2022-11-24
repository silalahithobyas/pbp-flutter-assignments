# Tugas 7 - counter_7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya!
Stateless widget merupakan widget berupa text, data dan lain-lain yang tidak akan pernah berubah. Tidak akan pernah berubah berarti perubahan yang dilakukan oleh
pengguna seperti meng-click dan yang lainnya atau perubahan lain terhadap data pada aplikasi tidak akan mengubah stateless widget. Data pada stateless widget hanya
mengacu pada data yang dimasukkan saat membuat stateless widget tersebut. Stateful widget merupakan kebalikan dari stateless widget dimana widget-widget yang stateful
dapat berubah-ubah tampilannya seperti mengupdate tampilan, merubah warna, menambah jumlah baris dan lain-lain. Stateful widget dapat berubah secara dinamis pada
aplikasi sesuai dengan kebutuhan.

Perbedaan
| Stateless Widget | Stateful Widget |
| -----------------| -----------------|
| Bersifat statis | Bersifat dinamis |
| Tidak bergantung pada perubahan data pada aplikasi | Bergantung pada perubahan data pada aplikasi |
| Tidak menggunakan setState() | Menggunakan setState() |
| Implementasi cocok untuk kebutuhan tampilan aplikasi yang tidak memerlukan perubahan tampilan | Implementasi cocok untuk kebutuhan tampilan aplikasi yang memerlukan perubahan tampilan |

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya!
1. Scaffold: untuk membuat UI dan tampilan visual pada aplikasi
2. FloatingActionButton: untuk membuat tombol yang dibutuhkan yakni tombol increment dan decrement sesuai dengan fungsinya masing-masing
3. Padding: untuk memberikan sizing pada elemen
4. Text: menampilkan tulisan sesuai dengan kebutuhan aplikasi
5. Center: untuk menaruh tipe bilangan dan perhitungan angkanya di tengah-tengah tampilan aplikasi
6. TextStyle: memberikan styling pada tulisan seperti memberi warna pada tulisan

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut!
setState() merupakan cara Flutter untuk melakukan rebuild widget saat ini dan turunannya. Selama proses rebuild dilakukan, nilai variabel terbaru akan digunakan untuk membuat UI yang baru. Variable yang terdampak pada fungsi adalah variabel _counter dimana counter pada variabel tersebut akan kemudian ditambah atau dikurang dan yang nantinya akan berpengaruh pada tulisan GANJIL atau GENAP saat muncul di interface pengguna.

##  Jelaskan perbedaan antara const dengan final!
Const harus menginisialisasi variabel sebelum compiling/runtime. Const tidak bisa memiliki nilai yang berbeda pada variabel yang sama. Sedangkan final tidak harus menginisialisasi variabel sebelum runtime karena final diatur setelah runtime. Final dapat memiliki nilai yang berbeda untuk variabel yang sama.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Create sebuah program Flutter baru dengan nama counter_7 dengan cara menjalankan flutter create counter_7 pada terminal
2. Membuat method _decrementCounter yang berfungsi untuk mengurangi nilai pada counter. Namun, jika nilai pada counter sudah 0 pada saat method tersebut dijalankan, maka counter tetap 0 bukan -1. Proses decrement variabel dilakukan dalam fungsi setState().
3. Pada body, di bagian childrennya ditambahkan widget dan conditional untuk handle tampilan tulisan GANJIL dan GENAP.
4. Membuat FloatingActionButton yang akan menampilkan 2 tombol yakni decrement dan increment dan menambahkan onPressed agar ketika button dipencet akan terhubung ke method yang seharusnya


# Tugas 8 - Flutter Form

## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement!
- Navigator.push            : Ketika menggunakan Navigator.push, page baru akan dipush ke stack dan menimpa page lama, sehingga route ke page lama tetap ada dan kita bisa kembali ke page lama.
- Navigator.pushReplacement : Ketika menggunakan Navigator.pushReplacement, page lama seolah-olah di pop terlebih dahulu, lalu page baru akan di-push. Maka, route ke page lama akan dihapus dan digantikan oleh page baru.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya!
1. Drawer           : Panel pilihan untuk perpindahan halaman
2. Form             : Container untuk tempat menampung input dari user
3. TextFormField    : Menerima input text pada form
4. TextButton       : Membuat button
5. TextStyle        : Mengatur style untuk text
6. Column           : Mengatur widget dengan format vertical
7. Row              : Mengatur widget dengan format horizontal
8. DropDownButton   : Fields untuk memilih input
9. ListTile         : Act sebagai wadah untuk menampung widget lain
10. Navigator       : Untuk perpindahan ke page lain

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)!
1. onPressed        : Terpanggil saat button ditekan
2. onLongPress      : Terpanggil saat button ditekan lama
3. onTap            : Terpanggil saat salah satu popup menu ditekan dan akan menjalankan actions yang telah ditentukan 
4. onFocusChanged   : Terpanggil saat focus berganti
5. onSaved          : Terpanggil dengan final value saat form telah di save via FormState
6. onHover          : Terpanggil saat pointer masuk ke button response area
7. onChanged        : Terpanggil saat user meninisiasi sebuah perubahan kepada value TextField

## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter!
Prinsip kerja navigator memiliki kemiripan dengan struktur data stack. Misalnya suatu layar ditampilkan maka layar tersebut berada di posisi top pada stack tersebut. Ketika kita ingin kembali pada layar sebelumnya, maka sistem melakukan pop pada stack tersebut (top akan terhapus) sehingga di tampilkanlah layar sebelumnya.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas!Menambahkan drawer menu dan navigasi
1. Routing pada widget drawner
2. Membuat form pada bagian body yang berisi textfield, dropdown, serta tombol submit di file tambah_budget
3. Menampilkan data yang telah di input pada halaman data_budget


# Tugas 9 - Integrasi Web Service pada Flutter

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa. Flutter mempunyai built-in function sebagai encoder dan decoder JSON yang disebut dengan 'dart:convert'. Flutter memiliki fungsi 'jsonDecode()' untuk decoding JSON dan mereturn 'Map<String, dynamic>'

Namun pengambilan data JSON tanpa pembuatan model terlebih dahulu pastinya tidak lebih baik daripada jika dilakukan pembuatan model terlebih dahulu. Pembuatan Plain Old Dart Object (PODO) direkomendasikan sebelum mengambil data JSON dari network request. Barulah kemudian di parsing sebagai JSON array yang di simpan sebagai object model tersebut.

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya!
- Future Builder    = untuk pengambilan data snapshot terbaru dari interaksinya dengan Future
- ListTile          = untuk menampilkan data
- ListView          = untuk menampilkan data, biasanya digunakan dalam sebuah scrolling widget
- Center, Row       = untuk mengatur tampilan 

## Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter!
1. Menambahkan http sebagai dependency pada path android/app/src/main/AndroidManifest.xml dengan menjalankan perintah 'flutter pub add http'
2. Membuat model penampung data dari JSON
3. By using the method GET, JSON akan ditangkap dan dibuat menjadi objek dari model yang telah dibuat
4. Menampilkan data dibantu dengan FutureBuilder

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas!
1. Add drawer My Watchlist pada navigator
2. Membuat mywatchlist.dart yang memuat class Watchlist
3. Mengintall dependensi http --> flutter pub add http
4. Membuat fetch function atau penangkap JSON
5. Menampilkan data-data dari mywatchlist pada Tugas 3 lampau
6. Menyambungkan tiap Watchlist ke details
7. Menambahkan halaman details untuk setiap mywatchlist yang ada pada daftar tersebut. Halaman ini menampilkan judul, release date, rating, review, dan status (watched/unwatched). --> Membuat routing ketika judul watchlist ditekan ke halaman dari file yang akan menampilkan detail tiap-tiap film nya.
8. Menambahkan tombol untuk kembali ke daftar mywatchlist --> membuat bottom Navigation bar sebagai tombol kembali ke menu awal
