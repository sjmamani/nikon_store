import 'package:flutter/material.dart';
import 'package:grocery_store/bloc/grocery_store_bloc.dart';
import 'package:grocery_store/screens/grocery_store_list.dart';

import '../bloc/grocery_provider.dart';
import 'grocery_store_cart.dart';

const _backgroundColor = Color(0xFFF6F5F2);
const cartBarHeight = 100.0;

class GroceryStoreHome extends StatefulWidget {
  const GroceryStoreHome({Key key}) : super(key: key);

  @override
  _GroceryStoreHomeState createState() => _GroceryStoreHomeState();
}

class _GroceryStoreHomeState extends State<GroceryStoreHome> {
  final bloc = GroceryStoreBLoC();

  void _onVerticalGesture(DragUpdateDetails details) {
    // print(details.primaryDelta);
    if (details.primaryDelta < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }
  }

  double _getTopForBlackPanel(GroceryState state, Size size) {
    if (state == GroceryState.normal) {
      return size.height - cartBarHeight;
    } else if (state == GroceryState.cart) {
      return cartBarHeight / 2;
    }
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getTopForWhitePanel(bloc.groceryState, size),
                      height: size.height - kToolbarHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                        child: Container(
                            child: GroceryStoreList(),
                            decoration: BoxDecoration(
                              color: _backgroundColor,
                            )),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                      left: 0,
                      right: 0,
                      top: _getTopForBlackPanel(bloc.groceryState, size),
                      height: size.height - cartBarHeight,
                      child: GestureDetector(
                        onVerticalDragUpdate: _onVerticalGesture,
                        child: _BlackPanel(bloc: bloc),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                        left: 0,
                        right: 0,
                        top: _getTopForAppBar(bloc.groceryState),
                        child: _AppBarGrocery()),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _BlackPanel extends StatelessWidget {
  const _BlackPanel({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final GroceryStoreBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: kToolbarHeight,
                child: bloc.groceryState == GroceryState.normal
                    ? _HorizontalCart(bloc: bloc)
                    : SizedBox.shrink(),
              ),
            ),
          ),
          Expanded(child: GroceryStoreCart())
        ],
      ),
    );
  }
}

class _HorizontalCart extends StatelessWidget {
  const _HorizontalCart({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final GroceryStoreBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Carrito',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Row(
                children: List.generate(
                    bloc.cart.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Stack(
                            children: [
                              Hero(
                                tag:
                                    'product_${bloc.cart[index].product.name}detail',
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      bloc.cart[index].product.images.first),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFF4C459),
                                  radius: 10.0,
                                  child: Text(
                                    bloc.cart[index].quantity.toString(),
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Color(0xFFF4C459),
          child: Text(
            bloc.totalCartElements().toString(),
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  const _AppBarGrocery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      height: kToolbarHeight,
      child: Row(
        children: [
          BackButton(),
          // const SizedBox(width: 10),
          Expanded(
            child: Text('Cámaras réflex digitales',
                style: Theme.of(context).textTheme.headline6),
          ),
          // IconButton(icon: Icon(Icons.translate), onPressed: () {})
        ],
      ),
    );
  }
}
