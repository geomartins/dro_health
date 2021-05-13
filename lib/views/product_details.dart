import 'package:dro_health/blocs/cart_bloc.dart';
import 'package:dro_health/components/custom_cart_dialog.dart';
import 'package:dro_health/components/custom_flat_button.dart';
import 'package:dro_health/components/custom_product_label.dart';
import 'package:dro_health/config/constants.dart';
import 'package:dro_health/models/cart_model.dart';
import 'package:dro_health/models/product_model.dart';
import 'package:dro_health/providers/cart_provider.dart';
import 'package:dro_health/providers/product_details_provider.dart';
import 'package:dro_health/views/products.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'product_details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final bloc = ProductDetailsProvider.of(context);
    final cartBloc = CartProvider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          child: SafeArea(
            child: StreamBuilder<ProductModel>(
                stream: bloc.product,
                builder: (context, AsyncSnapshot<ProductModel> snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  print(snapshot.data);

                  return snapshot.data != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildHeaderField(context, cartBloc),
                            SizedBox(height: 10.0),
                            _buildProductImage(snapshot.data.image),
                            SizedBox(height: 10.0),
                            _buildProductDescription(snapshot.data),
                            SizedBox(height: 20.0),
                            _buildProductDetails(snapshot.data),
                            SizedBox(height: 20.0),
                            _buildFooterField(context, snapshot.data, cartBloc),
                          ],
                        )
                      : Container();
                }),
          ),
        ),
      ),
    );
  }

  Widget buildHeaderField(BuildContext context, CartBloc cartBloc) {
    return Container(
      height: 50.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Products(initialChildSize: 0.9),
                    ));
              },
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      FlatIcons.con_snapchat,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Products(initialChildSize: 0.9),
                          )).then((value) {});
                    },
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  StreamBuilder<List<CartModel>>(
                      stream: cartBloc.cart,
                      initialData: [],
                      builder: (context, snapshot) {
                        int cartCount =
                            snapshot.data.fold(0, (i, el) => i + el.quantity);
                        print(snapshot.data.length);
                        return Text(
                          '${cartCount ?? '0'} ',
                          style: TextStyle(color: Colors.white, fontSize: 10.0),
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductImage(String image) {
    return Container(
      width: double.infinity,
      height: 130.0,
      child: Image.asset('assets/images/$image'),
    );
  }

  Widget _buildProductDescription(ProductModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Text(
              data.caption,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          children: [
            CircleAvatar(backgroundColor: kTertiaryColor.withOpacity(0.5)),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SOLD BY',
                  style: TextStyle(fontSize: 10.0, color: kTertiaryColor),
                ),
                Text(
                  data.brand,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.0),
        //TextField + Price
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 110.0,
                  height: 40.0,
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController()
                      ..text = quantity.toString(),
                    onChanged: (text) => {},
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: const BorderSide(
                            color: Color(0xff808080a6), width: 2.0),
                      ),
                      contentPadding: EdgeInsets.all(0.0),
                      isDense: true,
                      prefixIcon: GestureDetector(
                          onTap: () {
                            if (quantity >= 2) {
                              setState(() {
                                quantity -= 1;
                              });
                            }
                          },
                          child: Icon(Icons.remove)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity += 1;
                          });
                        },
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      //isCollapsed: true,
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  'Pack(s)',
                  style: TextStyle(color: kTertiaryColor, fontSize: 12.0),
                )
              ],
            ),
            Row(
              children: [
                Baseline(
                  baseline: 1,
                  baselineType: TextBaseline.ideographic,
                  child: Text(
                    'N',
                    style:
                        TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(width: 3.0),
                Text(
                  '${data.price * quantity}'.toString(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildProductDetails(ProductModel data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PRODUCT DETAILS',
          style:
              TextStyle(fontSize: 12.0, color: kTertiaryColor.withOpacity(0.5)),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomProductLabel(
              name: 'PACK SIZE',
              description: data.size,
              icon: FlatIcons.push_pin,
            ),
            CustomProductLabel(
              name: 'PRODUCT ID',
              description: data.uid,
              icon: FlatIcons.compact_disc_1,
            ),
            Container()
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomProductLabel(
              name: 'CONSTITUENT',
              description: data.constituent,
              icon: FlatIcons.compact_disc_1,
            ),
          ],
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomProductLabel(
              name: 'DISPENSED IN',
              description: data.packaging,
              icon: FlatIcons.network,
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.description,
              style: TextStyle(
                color: kTertiaryColor.withOpacity(1.0),
                fontSize: 10.0,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildFooterField(
      BuildContext context, ProductModel productModel, CartBloc bloc) {
    CartModel data = CartModel.fromProductModel(productModel);
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: CustomFlatButton(
                color: kPrimaryColor,
                textColor: Colors.white,
                title: 'Add to bag',
                icon: FlatIcons.con_snapchat,
                radius: 8.0,
                onPressed: () {
                  bloc.cartSink(data, quantity);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCartDialog(
                          title: 'Successful',
                          description:
                              '${data.name} has been added to your bag',
                          onDonePressed: () => Navigator.pop(context),
                          onViewPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Products(initialChildSize: 0.9),
                                ));
                          },
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
