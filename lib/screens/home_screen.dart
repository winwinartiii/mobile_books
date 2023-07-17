import 'package:flutter/material.dart';
import 'package:mobile_books/value/colour.dart';
import '../components/my_components.dart';
import '../model/books_model.dart';
import 'books_screen.dart';
import 'books_update_screen.dart';
import 'create_books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChecked = false;
  int addDelIndex = 0;

  List<Book> _filteredBooks = [];
  final List<Book> _books = [
    Book(id: '1', title: 'Book 1', author: 'Author 1'),
    Book(id: '2', title: 'Book 2', author: 'Author 2'),
    Book(id: '3', title: 'Book 3', author: 'Author 3'),
  ];

  String _filterTitle = '';
  String _filterAuthor = '';
  bool _sortAscending = true;


  @override
  void initState() {
    super.initState();
    _filteredBooks = _books;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        backgroundColor: ColorPallete.asiaQuest_red,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, right: 24, left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [addButton(), deleteButton()],
            ),
          ),
          headerPanel(),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _books.length,
              itemBuilder: (BuildContext context, int index) {
                final book = _books[index];
                return Container(
                  margin: EdgeInsets.only(left: 24, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          Text(book.title),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_calendar,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              _navigateToBookDetails(book);
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              addDelIndex = index;
                              deleteItem(_books[index].title, "del");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          detailButton()
        ],
      ),
    );
  }

  Widget addButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: 100,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
        child: ElevatedButton(
            style: ButtonStyle(
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
                        side: BorderSide(color: ColorPallete.blue_dark2)))),
            onPressed: () {
              _navigateToCreateBook();
            },
            child: const Text("add",
                style: TextStyle(fontSize: 14, color: Colors.black))),
      ),
    );
  }

  Widget deleteButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: 120,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
        child: ElevatedButton(
            style: ButtonStyle(
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
                        side: BorderSide(color: ColorPallete.blue_dark2)))),
            onPressed: () {},
            child: const Text("delete",
                style: TextStyle(fontSize: 14, color: Colors.black))),
      ),
    );
  }

  Widget detailButton() {
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
                  MaterialPageRoute(builder: (context) => BookScreen()));
            },
            child: Text("learn more",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.asiaQuest_red))),
      ),
    );
  }

  Widget headerPanel() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: MyTextField(
                  suffixIcon: Icon(Icons.search),
                  hintText: "Search",
                  textAlign: TextAlign.right,
                  backgroundColor: ColorPallete.white,
                  borderColor: ColorPallete.blue_dark2,
                  contentPadding: ContentPadding(top: 15, left: 20),
                  onChanged: (value) {
                    _filterTitle = value;
                    _filteredBooks = _filterAndSortBooks();
                  })),
          IconButton(
            icon: Image.asset('assets/images/sort.png'),
            onPressed: () {
              _sortAscending ? 'Ascending' : 'Descending';
              _sortAscending = !_sortAscending;
              _sortData();
            },
          ),
        ],
      ),
    );
  }

  Future deleteItem(String book, String type) async {
    setState(() {
      _books.removeWhere((element) => element.title == book);
    });
  }

  void _navigateToCreateBook() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateBookScreen(),
      ),
    );

    if (result != null && result is Book) {
      // Add new book
      setState(() {
        _books.add(result);
      });
    }
  }

  void _navigateToBookDetails(Book book) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book: book),
      ),
    );

    if (result != null) {
      if (result is Book) {
        // Update existing book
        setState(() {
          int index = _books.indexWhere((element) => element.id == result.id);
          if (index >= 0) {
            _books[index] = result;
          }
        });
      } else if (result is String) {
        // Delete book
        setState(() {
          _books.removeWhere((element) => element.id == result);
        });
      }
    }
  }

  List<Book> _filterAndSortBooks() {
    List<Book> filteredBooks = _books.where((book) {
      final titleMatch =
      book.title.toLowerCase().contains(_filterTitle.toLowerCase());
      final authorMatch =
      book.author.toLowerCase().contains(_filterAuthor.toLowerCase());

      return titleMatch && authorMatch;
    }).toList();

    return filteredBooks;
  }

  void _sortData() {
    setState(() {
      if (_sortAscending) {
        _filteredBooks.sort((a, b) => a.title.compareTo(b.title));
      } else {
        _filteredBooks.sort((a, b) => b.title.compareTo(a.title));
      }
    });
  }
}
