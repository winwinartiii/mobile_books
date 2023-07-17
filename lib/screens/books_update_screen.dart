import 'package:flutter/material.dart';
import '../model/books_model.dart';
import '../value/colour.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late Book _book;

  late TextEditingController _titleController;
  late TextEditingController _authorController;

  @override
  void initState() {
    super.initState();
    _book = widget.book;
    _titleController = TextEditingController(text: _book.title);
    _authorController = TextEditingController(text: _book.author);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  void _updateBookDetails() {
    final updatedBook = Book(
      id: _book.id,
      title: _titleController.text,
      author: _authorController.text,
    );
    Navigator.pop(context, updatedBook);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
        backgroundColor: ColorPallete.asiaQuest_red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
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
                  onPressed: _updateBookDetails,
                  child: Text('Update',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorPallete.asiaQuest_red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}