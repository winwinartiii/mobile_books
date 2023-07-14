import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_books/screens/home_screen.dart';
import 'dart:convert';

import '../value/colour.dart';

class BookProfile extends StatefulWidget {
  const BookProfile({super.key});

  @override
  State<BookProfile> createState() => _BookProfileState();
}

class _BookProfileState extends State<BookProfile> {
  final String isbn = '9780132350884'; // ISBN buku yang ingin dicari

  Future<String> getBookDescription(String isbn) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=isbn:$isbn'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['totalItems'] > 0) {
        final description = data['items'][0]['volumeInfo']['description'];
        return description ?? 'Description not available';
      }
    }

    return 'Book not found';
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(40),
                child: Image.asset(
                  "assets/images/book1.jpg", height: 150,
                )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12,top: 10),
              child: Text("A Handbook of Agile Software Craftsmanship",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)
              ),
            ),
            TextButton(
              onPressed: () async {
                String description = await getBookDescription(isbn);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Book Description'),
                      content: Text(description),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Deskripsi Singkat',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.bottomCenter,
              child: saveButton(),
            )
          ],
        )
      ),
    );
  }


  Widget saveButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: 150,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
        child: ElevatedButton(
            style: ButtonStyle(
              // shadowColor:  MaterialStateProperty.all<Color>(ColorPallete.colorPrimary),
                elevation: MaterialStateProperty.all(0),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(ColorPallete.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        side: BorderSide(color: ColorPallete.asiaQuest_red)))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Text("simpan",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.asiaQuest_red))),
      ),
    );
  }
}
