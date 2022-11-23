import 'package:counter_7/tambah_budget.dart';
import 'package:counter_7/data_budget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlistPage.dart';
import 'package:counter_7/model/mywatchlist.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class MyWatchlistDetailPage extends StatelessWidget {
  const MyWatchlistDetailPage({ super.key, required this.watchlist });

  final MyWatchlist watchlist;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Detail'),
          ),
          drawer: Drawer(
              child: Column(
                children: [
                  // Add clickable menu
                  ListTile(
                    title: const Text('counter_7'),
                    onTap: () {
                      // Routing menu ke homepage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Tambah Budget'),
                    onTap: () {
                      // Routing menu ke form page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const TambahBudgetPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Data Budget'),
                    onTap: () {
                      // Routing menu ke halaman data budget
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const DataBudgetPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('My Watchlist'),
                    onTap: () {
                      // Routing menu ke halaman watchlist
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                      );
                    },
                  ),
                ],
              ),
          ),
          body: Container( 
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 15),
            child: Stack(
              children: [
                ListView(
                  children: [
                    Center(
                      child:Text(
                        watchlist.fields.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        )
                      )
                    ),                  
                    const SizedBox(height: 8,),
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: const TextStyle(
                          color: Colors.black,
                          height: 1.9,
                        ),
                        
                        children: [
                          const TextSpan(text: 'Release Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: DateFormat.yMMMd('en_US').format(watchlist.fields.releaseDate)),

                          const TextSpan(text: '\nRating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${watchlist.fields.rating.toString()}/5'),

                          const TextSpan(text: '\nStatus: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: watchlist.fields.watched ? 'watched' : 'not watched'),

                          const TextSpan(text: '\nReview:\n', style: TextStyle(fontWeight: FontWeight.bold,)),
                          TextSpan(text: watchlist.fields.review, style: const TextStyle(height: 0)),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back'),
                    ),
                  ),
                )
              ],
            ),
          )
      );
  }
}