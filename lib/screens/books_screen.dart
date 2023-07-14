import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_books/screens/books_detail_screen.dart';
import 'package:mobile_books/screens/books_profile_screen.dart';
import 'package:mobile_books/value/colour.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: Index.pod_index,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            // title: Text("", style: TextStyle(color: ColorPallete.white)),
            backgroundColor: ColorPallete.asiaQuest_red,
            bottom: TabBar(
              indicatorColor: ColorPallete.asiaQuest_red,
              indicatorWeight: 5,
              indicatorPadding: EdgeInsets.all(0),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Profil",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Detil",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      BookProfile(),
                      BookDetail()
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
