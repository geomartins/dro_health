import 'package:dro_health/blocs/cart_bloc.dart';
import 'package:dro_health/components/custom_cart_list_tile.dart';
import 'package:dro_health/components/custom_checkout_dialog.dart';
import 'package:dro_health/components/custom_flat_button.dart';
import 'package:dro_health/config/constants.dart';
import 'package:dro_health/models/cart_model.dart';
import 'package:dro_health/providers/cart_provider.dart';
import 'package:dro_health/views/products.dart';
import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatelessWidget {
  final double initialChildSize;
  final double resize;

  const CustomDraggableSheet({Key key, this.initialChildSize, this.resize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = CartProvider.of(context);

    return DraggableScrollableSheet(
      initialChildSize: resize ?? initialChildSize,
      minChildSize: 0.09,
      builder: (BuildContext context, ScrollController scrollController) {
        print(scrollController);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: kUniversalColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildHeaderField(bloc),
                  Expanded(child: buildMainField(context, bloc)),
                  buildFooterField(context, bloc)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildHeaderField(CartBloc bloc) {
    return StreamBuilder<List<CartModel>>(
        stream: bloc.cart,
        initialData: [],
        builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
          int cartCount = snapshot.data.fold(0, (i, el) => i + el.quantity);
          double total = snapshot.data
              .fold(0, (i, el) => i + (el.unitPrice * el.quantity));
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0),
                  Container(
                    color: Colors.white,
                    width: 50.0,
                    height: 3.0,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.card_travel_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Bag',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 15.0,
                          backgroundColor: Colors.white,
                          child: Text(
                            cartCount.toString(),
                            style: TextStyle(fontSize: 12.0),
                          ),
                        )
                        // Container(
                        //   width: 40.0,
                        //   height: 40.0,
                        // )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              total > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(
                            'Tap on an item for add, remove and delete options',
                            style: TextStyle(fontSize: 9.0),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                        )
                      ],
                    )
                  : Container(),
            ],
          );
        });
  }

  Widget buildMainField(BuildContext context, CartBloc bloc) {
    return StreamBuilder<List<CartModel>>(
        stream: bloc.cart,
        initialData: [],
        builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          return snapshot.data.length > 0
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCartListTile(
                        data: snapshot.data[index], index: index, bloc: bloc);
                  })
              : Container();
        });
  }

  Widget buildFooterField(BuildContext context, CartBloc bloc) {
    return StreamBuilder<List<CartModel>>(
        stream: bloc.cart,
        initialData: [],
        builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
          double total = snapshot.data
              .fold(0, (i, el) => i + (el.unitPrice * el.quantity));
          return snapshot.data.length > 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0)),
                        Text('N${total.toString()}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0))
                      ],
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomFlatButton(
                          color: Colors.white,
                          textColor: Colors.black87,
                          title: 'Checkout',
                          radius: 20.0,
                          onPressed: () async {
                            bloc.checkout().then((value) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomCheckoutDialog(
                                      title: 'Transaction Successful',
                                      description:
                                          'Thanks for shopping with us... We hope to see you soon',
                                      onDonePressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Products(),
                                            ));
                                      },
                                    );
                                  });
                            });
                          }),
                    )
                  ],
                )
              : Container();
        });
  }
}
