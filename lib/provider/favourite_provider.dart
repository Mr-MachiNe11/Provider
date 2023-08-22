import 'package:flutter/foundation.dart';

class FavouriteProvider extends ChangeNotifier {
  List _selectedItems = [];

  List get selectedItem => _selectedItems;

  void addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItems.remove(value);
    notifyListeners();
  }
}
