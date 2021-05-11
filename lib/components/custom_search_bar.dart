import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(30.0),
          ),
          borderSide: const BorderSide(color: Color(0xff808080a6), width: 2.0),
        ),
        contentPadding: EdgeInsets.all(0.0),
        isDense: true,
        suffixIcon: Icon(FlatIcons.unlocked),
        prefixIcon: Icon(
          FlatIcons.search,
        ),
        //isCollapsed: true,
      ),
    );
  }
}
