import 'package:dro_health/blocs/cart_bloc.dart';
import 'package:dro_health/models/cart_model.dart';
import 'package:flutter/material.dart';

class CustomCartListTile extends StatelessWidget {
  final CartModel data;
  final int index;
  final CartBloc bloc;

  const CustomCartListTile({Key key, this.data, this.index, this.bloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.all(0.0),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/${data.image}'),
            maxRadius: 20.0,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            '${data.quantity}x',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      subtitle: Text('${data.category}',
          style: TextStyle(color: Colors.white, fontSize: 11.0)),
      title: Text(
        '${data.name}',
        style: TextStyle(color: Colors.white, fontSize: 13.0),
      ),
      trailing: Text(
        'N${data.price * data.quantity}',
        style: TextStyle(color: Colors.white, fontSize: 13.0),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                bloc.cartRemove(index);
              },
              child: Icon(
                Icons.delete_outline_outlined,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 15.0,
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      //remove item based on index
                      bloc.cartDecrease(index);
                    },
                    child: Icon(
                      Icons.remove_outlined,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    '${data.quantity}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                CircleAvatar(
                  maxRadius: 15.0,
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      bloc.cartIncrease(index);
                    },
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
