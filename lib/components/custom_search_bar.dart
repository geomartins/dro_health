import 'package:dro_health/blocs/products_bloc.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ProductsBloc bloc;

  const CustomSearchBar({Key key, this.bloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = new TextEditingController();
    return StreamBuilder<bool>(
        stream: bloc.searchToggle,
        initialData: true,
        builder: (context, snapshot) {
          return snapshot.data == true
              ? TextField(
                  controller: controller,
                  onChanged: (String value) {
                    bloc.searchProducts(value);
                  },
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
                      borderSide: const BorderSide(
                          color: Color(0xff808080a6), width: 2.0),
                    ),
                    contentPadding: EdgeInsets.all(0.0),
                    isDense: true,
                    suffixIcon: GestureDetector(
                      child: Icon(FlatIcons.unlocked),
                      onTap: () {
                        bloc.searchProducts('');
                        controller.text = "";
                      },
                    ),
                    prefixIcon: Icon(
                      FlatIcons.search,
                    ),
                    //isCollapsed: true,
                  ),
                )
              : Container();
        });
  }
}
