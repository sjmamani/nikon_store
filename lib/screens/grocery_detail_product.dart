import 'package:flutter/material.dart';
import 'package:grocery_store/models/grocery_product.dart';

class GroceryDetailProduct extends StatefulWidget {
  final GroceryProduct product;
  final Function(int) onProductAdded;
  const GroceryDetailProduct(
      {Key key, @required this.product, this.onProductAdded})
      : super(key: key);

  @override
  _GroceryDetailProductState createState() => _GroceryDetailProductState();
}

class _GroceryDetailProductState extends State<GroceryDetailProduct> {
  String heroTag = '';
  int cantidad = 1, selectedImage = 0;

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'detail';
    });
    widget.onProductAdded(cantidad);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          selectedImage = value;
                        });
                      },
                      itemCount: widget.product.images.length,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: 'product_${widget.product.name}$heroTag',
                          child: Image.asset(
                            widget.product.images[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < widget.product.images.length; i++)
                        _buildDot(i, selectedImage)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          widget.product.name,
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          widget.product.stock,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Row(
                              children: [
                                buildIcon(
                                    icon: Icons.remove,
                                    press: () {
                                      if (cantidad > 1) {
                                        setState(() {
                                          cantidad--;
                                        });
                                      }
                                    }),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Text(
                                    cantidad.toString().padLeft(2, '0'),
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                buildIcon(
                                    icon: Icons.add,
                                    press: () {
                                      setState(() {
                                        cantidad++;
                                      });
                                    })
                              ],
                            ),
                            Spacer(),
                            Text(
                              'AR\$${widget.product.price.toStringAsFixed(3)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Acerca del producto',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.product.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () => null,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: RaisedButton(
                      onPressed: () => _addToCart(context),
                      color: Color(0xFFF4C459),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text('Agregar al carrito'),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget _buildDot(int index, int selectedIndex) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2.5),
    height: 10,
    width: 10,
    decoration: BoxDecoration(
        color: index == selectedIndex ? Color(0xFFF4C459) : Colors.grey[300],
        shape: BoxShape.circle),
  );
}

SizedBox buildIcon({IconData icon, Function press}) {
  return SizedBox(
    height: 32,
    width: 40,
    child: OutlineButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Icon(icon),
    ),
  );
}
