import 'package:flutter/material.dart';
import '../model/books_model.dart';
import '../value/colour.dart';

class CreateBookScreen extends StatefulWidget {
  @override
  _CreateBookScreenState createState() => _CreateBookScreenState();
}

class _CreateBookScreenState extends State<CreateBookScreen> {
  late TextEditingController _titleController;
  late TextEditingController _authorController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _authorController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  void _createBook() {
    final newBook = Book(
      id: DateTime.now().toString(),
      title: _titleController.text,
      author: _authorController.text,
    );
    Navigator.pop(context, newBook);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Book'),
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
            ElevatedButton(
              style: ButtonStyle(
                  // shadowColor:  MaterialStateProperty.all<Color>(ColorPallete.colorPrimary),
                  elevation: MaterialStateProperty.all(0),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorPallete.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          side:
                              BorderSide(color: ColorPallete.asiaQuest_red)))),
              onPressed: _createBook,
              child: Text('Create',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorPallete.asiaQuest_red)),
            ),
          ],
        ),
      ),
    );
  }
}
