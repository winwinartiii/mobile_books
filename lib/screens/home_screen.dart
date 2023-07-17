import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_books/value/colour.dart';
import '../components/my_components.dart';
import 'books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isChecked = false;
  int addDelIndex = 0;
  final List<String> _data = [
    "A Handbook of Agile",
    "Book 1",
    "Book 2",
    "Book 3",
  ];

  List<String> _filteredData = [];
  bool _sortAscending = true;
  String _filterText = '';


  @override
  void initState() {
    _filteredData = _data;
    super.initState();
  }

  void _filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(_data);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(_data);
      });
    }
  }

  void _sortData() {
    setState(() {
      if (_sortAscending) {
        _filteredData.sort((a, b) => a.compareTo(b));
      } else {
        _filteredData.sort((a, b) => b.compareTo(a));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        backgroundColor: ColorPallete.asiaQuest_red,
      ),
      body:Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, right: 24, left: 24),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addButton(),
                deleteButton()
              ],
            ),
          ),
          headerPanel(),
          SizedBox(height: 40,),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (BuildContext context, int index) {
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
                         Text(_filteredData[index]),
                       ],
                     ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_calendar, color: Colors.grey,),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,color: Colors.grey,),
                          onPressed: () {
                            addDelIndex = index;
                            deleteItem(_data[index], "del");
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text("add",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black))),
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
            onPressed: () {
              deleteItem(_data[0], "del");
            },
            child: const Text("delete",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black))),
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
                  suffixIcon : Icon(Icons.search),
                  hintText : "Search",
                  textAlign : TextAlign.right,
                  backgroundColor : ColorPallete.white,
                  borderColor : ColorPallete.blue_dark2,
                  contentPadding : ContentPadding(top : 15, left : 20),
                  onChanged : (value) {_filterSearchResults(value);}
              )
          ),
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

  Future deleteItem(String book,String type) async {
    setState(() {
      _data.removeWhere((element) => element == book);
    });
  }

}

