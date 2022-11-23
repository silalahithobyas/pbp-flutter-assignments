import 'package:counter_7/tambah_budget.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/mywatchlistDeets.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({ super.key });

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
    Future<List<MyWatchlist>> fetchMyWatchlist() async {
        var url = Uri.parse('https://tugas-lab-2.herokuapp.com/mywatchlist/json');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyWatchlist
        List<MyWatchlist> listMyWatchlist = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchlist.add(MyWatchlist.fromJson(d));
        }
        }

        return listMyWatchlist;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watchlist'),
            ),
            drawer: Drawer(
                child: Column(
                  children: [
                    // Menambahkan clickable menu
                    ListTile(
                      title: const Text('counter_7'),
                      onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Tambah Budget'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Data Budget'),
                      onTap: () {
                        // Route menu ke halaman data budget
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
            body: FutureBuilder(
                future: fetchMyWatchlist(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                    if (!snapshot.hasData) {
                        return Column(
                        children: const [
                            Text(
                            "Tidak ada watchlist :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index)=> InkWell(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0
                                      )
                                    ]
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                        fontSize: 18.0,
                                        ),
                                    ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyWatchlistDetailPage(watchlist: snapshot.data[index]),
                                    ),
                                  );
                                },
                            )
                        );
                    }
                    }
                }
            )
        );
    }
}