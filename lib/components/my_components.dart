// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../value/colour.dart';

class ContentPadding {
  const ContentPadding({
    this.left,  this.top,
    this.right, this.bottom,
  });

  final int? left;  final int? top;
  final int? right; final int? bottom;
}


class MyBoxShadow {
  const MyBoxShadow({
    this.opacity,       this.blurRadius,
    this.spreadRadius,  this.offset,
  });

  final int? opacity;       final int? blurRadius;
  final int? spreadRadius;  final offset;
}


class MyCard extends StatelessWidget {
  const MyCard({
    this.backgroundColor, this.borderColor,
    this.borderRadius,    this.elevation,
    this.borderWidth,     this.contentPadding,
    this.color,
    required this.content
  });

  final backgroundColor;
  final color;  final borderColor;
  final int? borderWidth;   final int? elevation;
  final int? borderRadius;  final ContentPadding? contentPadding;
  final content;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor != null ? backgroundColor : ColorPallete.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              borderRadius != null ? borderRadius!.toDouble() : 10
          ),
          side: BorderSide(
              width: borderWidth != null ? borderWidth!.toDouble() : 0,
              color: borderColor != null ? borderColor : Colors.transparent
          )
      ),
      elevation: elevation != null ? elevation!.toDouble() : 10,
      child: Container(
          padding: contentPadding != null ? EdgeInsets.only(
            left: contentPadding?.left != null ? contentPadding!.left!.toDouble() : 25,
            right: contentPadding?.right != null ? contentPadding!.right!.toDouble() : 25,
            top: contentPadding?.top != null ? contentPadding!.top!.toDouble() : 20,
            bottom: contentPadding?.bottom != null ? contentPadding!.bottom!.toDouble() : 20,
          ) : EdgeInsets.fromLTRB(25, 20, 25, 20),
          width: double.infinity,
          child: content
      ),
    );
  }
}


class MyTextField extends StatelessWidget {
  const MyTextField({
    this.width,           this.textAlign,
    this.height,          this.prefixText,
    this.borderRadius,    this.suffixText,
    this.borderColor,     this.hintText,
    this.backgroundColor, this.hintText_fontSize,
    this.boxShadow,       this.suffixIcon,
    this.maxLines,        this.prefixIcon,
    this.minLines,        this.contentPadding,
    this.controller,      this.inputText_fontSize,
    this.autofocus,       this.color,
    this.keyboardType,    this.obscureText,
    this.initialValue,    this.onSaved,
    this.enabled,         this.validator,
    this.onChanged,
  });

  final int? width;               final textAlign;
  final int? height;              final String? prefixText;
  final int? borderRadius;        final String? suffixText;
  final borderColor;              final String? hintText;
  final backgroundColor;          final int? hintText_fontSize;
  final MyBoxShadow? boxShadow;   final suffixIcon;
  final int? maxLines;            final prefixIcon;
  final int? minLines;            final ContentPadding? contentPadding;
  final controller;               final int? inputText_fontSize;
  final bool? autofocus;          final color;
  final keyboardType;             final bool? obscureText;
  final initialValue;             final onSaved;
  final bool? enabled;            final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width!.toDouble() : null,
      height: height != null ? height!.toDouble() : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius != null ? borderRadius!.toDouble() : 10
        ),
        border: borderColor != null
            ? Border.all(color: borderColor)
            : null,
        color: backgroundColor != null ? backgroundColor : Colors.white,
        boxShadow: boxShadow != null ? [
          BoxShadow(
            color: Colors.black.withOpacity(boxShadow?.opacity != null ? boxShadow!.opacity!.toDouble() : 0.3),
            spreadRadius: boxShadow?.spreadRadius != null ? boxShadow!.spreadRadius!.toDouble() : 0,
            blurRadius: boxShadow?.blurRadius != null ? boxShadow!.blurRadius!.toDouble() : 10,
            offset: boxShadow!.offset != null ? boxShadow!.offset : Offset(0, 5), // changes position of shadow
          ),
        ] : [],
      ),
      child: TextFormField(
        maxLines: maxLines != null ? maxLines : 1,
        minLines: minLines != null ? minLines : 1,
        controller: controller != null ? controller : null,
        autofocus: autofocus != null ? autofocus! : false,
        keyboardType: keyboardType != null ? keyboardType : null,
        initialValue: initialValue != null ? initialValue : null,
        enabled: enabled != null ? enabled : true,
        textAlign: textAlign != null ? textAlign : TextAlign.center,
        decoration: InputDecoration(
          prefixText: prefixText != null ? prefixText : null,
          suffixText: suffixText != null ? suffixText : null,
          border: InputBorder.none,
          hintText: hintText != null ? hintText : "",
          hintStyle: TextStyle(
            fontSize: hintText_fontSize != null ? hintText_fontSize!.toDouble() : 16,
          ),
          suffixIcon: suffixIcon != null ? suffixIcon : null,
          prefixIcon: prefixIcon != null ? prefixIcon : null,
          contentPadding: contentPadding != null ? EdgeInsets.only(
              left: contentPadding?.left != null ? contentPadding!.left!.toDouble() : 10,
              right: contentPadding?.right != null ? contentPadding!.right!.toDouble() : 10,
              top: contentPadding?.top != null ? contentPadding!.top!.toDouble() : 10,
              bottom: contentPadding?.bottom != null ? contentPadding!.bottom!.toDouble() : 10
          ) : EdgeInsets.all(10),
        ),
        style: TextStyle(
            fontSize: inputText_fontSize != null ? inputText_fontSize!.toDouble() : 16,
            color: color != null ? color : Colors.black
        ),
        obscureText: obscureText != null ? obscureText! : false,
        onSaved: onSaved != null ? onSaved : null,
        validator: validator != null ? validator : null,
        onChanged: onChanged != null ? onChanged : null,
      ),
    );
  }
}

class MyDropDownField extends StatelessWidget {
  const MyDropDownField({
    this.width,           this.value,
    this.height,          this.icon,
    this.contentPadding,  this.iconSize,
    this.borderRadius,    this.elevation,
    this.backgroundColor, this.color,
    this.boxShadow,       this.inputText_fontSize,
    this.hintText,        this.onChanged,
    this.menuMaxHeight,   required this.items,
  });

  final int? width;                     final value;
  final int? height;                    final icon;
  final ContentPadding? contentPadding; final int? iconSize;
  final int? borderRadius;              final int? elevation;
  final backgroundColor;                final int? inputText_fontSize;
  final MyBoxShadow? boxShadow;         final color;
  final String? hintText;               final onChanged;
  final int? menuMaxHeight;             final items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width!.toDouble() : null,
      height: height != null ? height!.toDouble() : null,
      padding: contentPadding != null ? EdgeInsets.only(
          left: contentPadding?.left != null ? contentPadding!.left!.toDouble() : 10,
          right: contentPadding?.right != null ? contentPadding!.right!.toDouble() : 10,
          top: contentPadding?.top != null ? contentPadding!.top!.toDouble() : 10,
          bottom: contentPadding?.bottom != null ? contentPadding!.bottom!.toDouble() : 10
      ) : EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            borderRadius != null ? borderRadius!.toDouble() : 10
        ),
        color: backgroundColor != null ? backgroundColor : Colors.white,
        boxShadow: boxShadow != null ? [
          BoxShadow(
            color: Colors.black.withOpacity(
                boxShadow?.opacity != null ? boxShadow!.opacity!.toDouble() : 0.3
            ),
            spreadRadius: boxShadow?.spreadRadius != null ? boxShadow!.spreadRadius!.toDouble() : 0,
            blurRadius: boxShadow?.blurRadius != null ? boxShadow!.blurRadius!.toDouble() : 10,
            // offset: boxShadow?.offset != null ? boxShadow?.offset : Offset(0, 5), // changes position of shadow
          ),
        ] : [],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text(
              hintText != null ? hintText! : ""
          ),
          isDense: true,
          isExpanded: true,
          menuMaxHeight: menuMaxHeight != null ? menuMaxHeight!.toDouble() : null,
          value: value != null ? value : null,
          icon: icon != null ? icon : null,
          iconSize: iconSize != null ? iconSize!.toDouble() : 20,
          elevation: elevation != null ? elevation! : 10,
          style: TextStyle(
            fontSize: inputText_fontSize != null ? inputText_fontSize!.toDouble() : 16,
            color: color != null ? color : Colors.black,
          ),
          onChanged: onChanged != null ? onChanged : () {},
          items: items,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    this.width,
    this.height,
    this.boxShadow,
    this.contentPadding,
    this.text,
    this.fontSize,
    this.color,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
    required this.actions,
  });

  final int? width;
  final int? height;
  final MyBoxShadow? boxShadow;
  final ContentPadding? contentPadding;
  final String? text;
  final int? fontSize;
  final color;
  final int? borderRadius;
  final borderColor;
  final backgroundColor;
  final actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width!.toDouble() : null,
      height: height != null ? height!.toDouble() : null,
      decoration: BoxDecoration(
        boxShadow: boxShadow != null ? [
          BoxShadow(
            color: Colors.black.withOpacity(
                boxShadow?.opacity != null ? boxShadow!.opacity!.toDouble() : 0.3
            ),
            spreadRadius: boxShadow?.spreadRadius != null ? boxShadow!.spreadRadius!.toDouble() : 0,
            blurRadius: boxShadow?.blurRadius != null ? boxShadow!.blurRadius!.toDouble() : 10,
            offset: boxShadow?.offset != null ? boxShadow?.offset : Offset(0, 5), // changes position of shadow
          ),
        ] : [],
      ),
      child: ElevatedButton(
        child: Container(
          padding: contentPadding != null ? EdgeInsets.only(
              left: contentPadding?.left != null ? contentPadding!.left!.toDouble() : 10,
              right: contentPadding?.right != null ? contentPadding!.right!.toDouble() : 10,
              top: contentPadding?.top != null ? contentPadding!.top!.toDouble() : 10,
              bottom: contentPadding?.bottom != null ? contentPadding!.bottom!.toDouble() : 10
          ) : EdgeInsets.all(10),
          child: Text(
            text != null ? text! : "",
            style: TextStyle(
                fontSize: fontSize != null ? fontSize!.toDouble() : 16,
                color: color != null ? color : Colors.white
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      borderRadius != null ? borderRadius!.toDouble() : 10
                  ),
                  side: BorderSide(
                      color: borderColor != null ? borderColor : Colors.transparent
                  )
              )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
              backgroundColor != null ? backgroundColor : ColorPallete.asiaQuest_red
          ),
        ),
        onPressed: actions,
      ),
    );
  }
}

Widget myButton(data, _action) {
  return Container(
    width: data[0]['width'] != null ? data[0]['width'].toDouble() : null,
    height: data[0]['height'] != null ? data[0]['height'].toDouble() : null,
    decoration: BoxDecoration(
      boxShadow: data[0]['boxShadow'] != null ? [
        BoxShadow(
          color: Colors.black.withOpacity(
              data[0]['boxShadow']['opacity'] != null ? data[0]['boxShadow']['opacity'].toDouble() : 0.3
          ),
          spreadRadius: data[0]['boxShadow']['spread'] != null ? data[0]['boxShadow']['spread'].toDouble() : 0,
          blurRadius: data[0]['boxShadow']['blur'] != null ? data[0]['boxShadow']['blur'].toDouble() : 10,
          offset: data[0]['boxShadow']['offset'] != null ? data[0]['boxShadow']['offset'] : Offset(0, 5), // changes position of shadow
        ),
      ] : [],
    ),
    child: ElevatedButton(
      child: Container(
        padding: data[0]['content-padding'] != null ? EdgeInsets.only(
            left: data[0]['content-padding']['left'] != null ? data[0]['content-padding']['left'].toDouble() : 10,
            right: data[0]['content-padding']['right'] != null ? data[0]['content-padding']['right'].toDouble() : 10,
            top: data[0]['content-padding']['top'] != null ? data[0]['content-padding']['top'].toDouble() : 10,
            bottom: data[0]['content-padding']['bottom'] != null ? data[0]['content-padding']['bottom'].toDouble() : 10
        ) : EdgeInsets.all(10),
        child: Text(
          data[0]['text'] != null ? data[0]['text'] : "",
          style: TextStyle(
              fontSize: data[0]['fontSize'] != null ? data[0]['fontSize'].toDouble() : 16,
              color: data[0]['color'] != null ? data[0]['color'] : Colors.white
          ),
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    data[0]['borderRadius'] != null ? data[0]['borderRadius'].toDouble() : 10
                ),
                side: BorderSide(
                    color: data[0]['borderColor'] != null ? data[0]['borderColor'] : Colors.transparent
                )
            )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            data[0]['backgroundColor'] != null ? data[0]['backgroundColor'] : ColorPallete.asiaQuest_red
        ),
      ),
      onPressed: _action,
    ),
  );
}


Widget myIconButton(data, _action) {
  return Container(
    width: data[0]['width'] != null ? data[0]['width'].toDouble() : null,
    height: data[0]['height'] != null ? data[0]['height'].toDouble() : null,
    decoration: BoxDecoration(
      boxShadow: data[0]['boxShadow'] != null ? [
        BoxShadow(
          color: Colors.black.withOpacity(
              data[0]['boxShadow']['opacity'] != null ? data[0]['boxShadow']['opacity'].toDouble() : 0.3
          ),
          spreadRadius: data[0]['boxShadow']['spread'] != null ? data[0]['boxShadow']['spread'].toDouble() : 0,
          blurRadius: data[0]['boxShadow']['blur'] != null ? data[0]['boxShadow']['blur'].toDouble() : 10,
          offset: data[0]['boxShadow']['offset'] != null ? data[0]['boxShadow']['offset'] : Offset(0, 5), // changes position of shadow
        ),
      ] : [],
    ),
    child: ElevatedButton(
      child: Container(
          padding: data[0]['content-padding'] != null ? EdgeInsets.only(
              left: data[0]['content-padding']['left'] != null ? data[0]['content-padding']['left'].toDouble() : 10,
              right: data[0]['content-padding']['right'] != null ? data[0]['content-padding']['right'].toDouble() : 10,
              top: data[0]['content-padding']['top'] != null ? data[0]['content-padding']['top'].toDouble() : 10,
              bottom: data[0]['content-padding']['bottom'] != null ? data[0]['content-padding']['bottom'].toDouble() : 10
          ) : EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              data[0]['prefixIcon'] != null ? Container(
                margin: data[0]['prefixIcon'] != null ? EdgeInsets.only(right: 5) : EdgeInsets.only(right: 0),
                child: Expanded(child: data[0]['prefixIcon']),
              ) : Container(),
              Text(
                data[0]['text'] != null ? data[0]['text'] : "",
                style: TextStyle(
                    fontSize: data[0]['fontSize'] != null ? data[0]['fontSize'].toDouble() : 16,
                    color: data[0]['color'] != null ? data[0]['color'] : Colors.white
                ),
              ),
              data[0]['suffixIcon'] != null ? Container(
                margin: data[0]['suffixIcon'] != null ? EdgeInsets.only(right: 5) : EdgeInsets.only(right: 0),
                child: Expanded(child: data[0]['suffixIcon']),
              ) : Container(),
            ],
          )
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    data[0]['borderRadius'] != null ? data[0]['borderRadius'].toDouble() : 10
                ),
                side: BorderSide(
                    color: data[0]['borderColor'] != null ? data[0]['borderColor'] : Colors.transparent
                )
            )
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
            data[0]['backgroundColor'] != null ? data[0]['backgroundColor'] : ColorPallete.asiaQuest_red
        ),
      ),
      onPressed: _action,
    ),
  );

}


class MyEllipse extends StatelessWidget {
  const MyEllipse({
    this.size,
    this.color,
  });

  final int? size;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size != null ? size!.toDouble() : 80,
      height: size != null ? size!.toDouble() : 80,
      decoration: BoxDecoration(
        color: color != null ? color : ColorPallete.asiaQuest_red,
        borderRadius:  BorderRadius.all(Radius.elliptical(
            size != null ? (size!/2).toDouble() : 40,
            size != null ? (size!/2).toDouble() : 40
        )),
      ),
    );
  }
}