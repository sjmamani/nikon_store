import 'package:flutter/material.dart';
import 'package:grocery_store/screens/grocery_detail_product.dart';
import 'package:grocery_store/bloc/grocery_provider.dart';

import 'grocery_store_home.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return GridView.builder(
      padding: const EdgeInsets.only(top: cartBarHeight, left: 15, right: 15),
      itemCount: bloc.catalog.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            return Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, __) {
                return FadeTransition(
                  opacity: animation,
                  child: GroceryDetailProduct(
                      product: bloc.catalog[index],
                      onProductAdded: (quantity) {
                        bloc.addProduct(bloc.catalog[index],
                            quantity); // we pass the product
                      }),
                );
              },
            ));
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            shadowColor: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Hero(
                    tag: 'product_${bloc.catalog[index].name}',
                    child: Image.asset(
                      bloc.catalog[index].images.first,
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'AR',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${bloc.catalog[index].price.toStringAsFixed(3)}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    bloc.catalog[index].name,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    bloc.catalog[index].stock,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
