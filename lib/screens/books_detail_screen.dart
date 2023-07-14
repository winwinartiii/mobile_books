import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../value/colour.dart';
import 'home_screen.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  TextEditingController codeBookController = new TextEditingController();
  TextEditingController isbnController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController CategoryController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  late String Date;
  int _maxLength = 7;
  bool _isInputValid = true;

  void _validateInput(String value) {
    setState(() {
      _isInputValid = value.length <= _maxLength;
    });
  }

  String? _selectedItem;

  final List<String> _dropdownItems = [
    'Bisnis',
    'Komputer',
    'Novel',
    'Sejarah',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: codeBookController,
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 12),
                autofocus: false,
                decoration: InputDecoration(
                  errorText:
                      _isInputValid ? null : 'Minimum length is $_maxLength',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: ColorPallete.white,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Kode Buku',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ColorPallete.asiaQuest_grey_color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) => value!.isEmpty ? '' : null,
                onChanged: (value) {
                  _isInputValid = value.length <= _maxLength;
                  codeBookController.value = TextEditingValue(
                      text: value.toUpperCase(),
                      selection: codeBookController.selection);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: priceController,
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 12),
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText:
                      _isInputValid ? null : 'Minimum length is $_maxLength',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: ColorPallete.white,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Harga Buku',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ColorPallete.asiaQuest_grey_color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) => value!.isEmpty ? '' : null,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: DropdownButton(
                value: _selectedItem,
                items: _dropdownItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                hint: Text('Kategori Buku'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: dateController,
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 12),
                keyboardType: TextInputType.text,
                autofocus: false,
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.calendar_month,
                      size: 16, color: ColorPallete.blue_dark2),
                  hintText: 'Tanggal Terbit',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ColorPallete.blue_dark2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ColorPallete.blue_dark2,
                    ),
                  ),
                ),
                onTap: showArrivalDateDialog,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextFormField(
                controller: isbnController,
                maxLines: 1,
                style: TextStyle(color: Colors.black, fontSize: 12),
                autofocus: false,
                textCapitalization: TextCapitalization.characters,
                onEditingComplete: () {
                  // _updateDetail(codeBookController.text, addDelIndex==0?"add":"del");
                },
                decoration: InputDecoration(
                  errorText:
                      _isInputValid ? null : 'Minimum length is $_maxLength',
                  isDense: true,
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: ColorPallete.white,
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'ISBN',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ColorPallete.asiaQuest_grey_color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) => value!.isEmpty ? '' : null,
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: saveButton(),
            )
          ],
        ),
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

  void showArrivalDateDialog() {
    DatePicker.showDatePicker(context, showTitleActions: true,
        onConfirm: (date) {
      setState(() {});
    }, currentTime: DateTime.now(), locale: LocaleType.id);
  }
}
