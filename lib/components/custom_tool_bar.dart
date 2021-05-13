import 'package:dro_health/blocs/products_bloc.dart';
import 'package:dro_health/config/constants.dart';
import 'package:flutter/material.dart';

class CustomToolBar extends StatelessWidget {
  final ProductsBloc bloc;

  const CustomToolBar({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(Icons.import_export_outlined),
            onTap: () {},
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
        ),
        StreamBuilder<bool>(
            stream: bloc.searchToggle,
            initialData: true,
            builder: (context, snapshot) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: snapshot.data == false
                      ? Colors.grey.shade200
                      : kPrimaryColor,
                ),
                padding: EdgeInsets.all(5.0),
                child: GestureDetector(
                  child: snapshot.data == false
                      ? Icon(Icons.search)
                      : Icon(Icons.search, color: Colors.white),
                  onTap: () {
                    bloc.searchToggleSink(!snapshot.data);
                  },
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
              );
            }),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
          ),
          padding: EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(
              Icons.filter_alt_outlined,
            ),
            onTap: () {},
          ),
          margin: EdgeInsets.symmetric(horizontal: 10.0),
        ),
      ],
    );
  }
}
