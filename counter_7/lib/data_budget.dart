import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {

  // Save data ke dalam list
  static List<String> listJudul = [];
  static List<String> listJenis = [];
  static List<int> listNominal = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
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
            onTap: (){
              // Routing menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Daftar Budget'),
            onTap: () {
              // Routing menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataBudgetPage()),
              );
            },
          ),
        ],
      ),
    ),

      body:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            listJudul[index], style: const TextStyle(fontSize: 27),
                            textAlign: TextAlign.left),
                      ),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(listNominal[index].toString(), style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(listJenis[index], style: TextStyle(fontSize: 17),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                        ]
                    ),
                  ],
                )
            ),
          );
        },
        itemCount: listJudul.length,
      ),
    );
  }
}

void dataInputBudget(String judul, int nominal, String jenis){
  _DataBudgetPageState.listJudul.add(judul);
  _DataBudgetPageState.listJenis.add(jenis);
  _DataBudgetPageState.listNominal.add(nominal);
}