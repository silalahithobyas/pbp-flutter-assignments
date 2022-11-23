import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/page/mywatchlistPage.dart';


class TambahBudgetPage extends StatefulWidget {
    const TambahBudgetPage({super.key});

    @override
    State<TambahBudgetPage> createState() => _TambahBudgetPageState();
}



class _TambahBudgetPageState extends State<TambahBudgetPage> {

final _formKey = GlobalKey<FormState>();
String _judul = "";
int _nominal = 0;
String pilihJenis = 'Pengeluaran';
List<String> listJenis = ['Pengeluaran','Pemasukan'];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Form'),
            ),
            drawer: Drawer(
      child: Column(
        children: [
          // Add clickable menu
          const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              ),
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // Routing menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Routing menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Routing menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('My Watchlist'),
            onTap: () {
              // Route menu ke halaman watchlist
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
              );
            },          
          ),                              
        ],
      ),
    ),
    body: Form(
        key: _formKey,
         child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(  
              children: [

                // Make form title
                Padding(
                    // Padding 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Judul",
                            labelText: "Judul",
                            // Add circular border supaya lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),
                        // Add behaviour saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _judul = value!;
                            });
                        },
                        // Add behaviour saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _judul = value!;
                            });
                        },
                        // Validator for form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Judul tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),

                // Make nominal form
                Padding(
                    // Padding 8 pixels
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Nominal",
                            labelText: "Nominal",
                            // Add circular border agar lebih rapi
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                            ),
                        ),

                        keyboardType: TextInputType.number,

                        // Add behaviour saat nama diketik 
                        onChanged: (String? value) {
                            setState(() {
                                _nominal = int.parse(value!);
                            });
                        },
                        // Add behaviour saat data disimpan
                        onSaved: (String? value) {
                            setState(() {
                                _nominal = value! as int;
                            });
                        },
                        // Validator for form validation
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                            }
                            return null;
                        },
                    ),
                ),

                // Make dropdown button untuk Jenis Budget
                ListTile(
                title: const Text(
                    'Jenis',
                ),
                trailing: DropdownButton(
                    value: pilihJenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenis.map((String items) {
                    return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                    );
                    }).toList(),
                    onChanged: (String? newValue) {
                    setState(() {
                        pilihJenis = newValue!;
                    });
                    },
                ),
                ),

              // Save button
              TextButton(
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                      dataInputBudget(_judul, _nominal, pilihJenis);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                      );
                    }
              },
            ),

              ],
            ),
            ),
         ),
         ),
        );
    }
}