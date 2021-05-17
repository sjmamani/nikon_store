import 'package:flutter/material.dart';

import '../bloc/grocery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.keyboard_arrow_down, color: Colors.white),
                Text(
                  'Carrito',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.cart.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  bloc.cart[index].product.images.first),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              '${bloc.cart[index].quantity}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'x',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '${bloc.cart[index].product.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              'AR\$${(bloc.cart[index].product.price * bloc.cart[index].quantity).toStringAsFixed(3)}',
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                bloc.deleteProduct(bloc.cart[index]);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[600],
                child: Icon(
                  Icons.local_shipping,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text('Envío', style: TextStyle(color: Colors.white)),
              Spacer(),
              Text(
                '\$500',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Spacer(),
                Text(
                  bloc.totalPriceElements() == 0
                      ? 'AR\$${bloc.totalPriceElements().toStringAsFixed(2).toString()}'
                      : 'AR\$${bloc.totalPriceElements().toStringAsFixed(3).toString()}',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
          ),
          RaisedButton(
            onPressed: () => null,
            color: Color(0xFFF4C459),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text('Siguiente'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ],
      ),
    );
  }
}
