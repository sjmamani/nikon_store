import 'package:flutter/cupertino.dart';
import 'package:grocery_store/bloc/grocery_store_bloc.dart';

class GroceryProvider extends InheritedWidget {
  final Widget child;
  final GroceryStoreBLoC bloc;

  GroceryProvider({@required this.child, @required this.bloc})
      : super(child: child);

  static GroceryProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GroceryProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
