# counter_7

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
