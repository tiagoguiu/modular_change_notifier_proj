import 'package:flutter/material.dart';

import '../../../exports.dart';

class CollectInfoController extends ChangeNotifier {
  final CollectInfoRepository repository;

  CollectInfoController(this.repository);

  List<String> items = [];

  Future<void> addInfo(String info) async {
    await repository.saveInfo(info);
    items.add(info);
    notifyListeners();
  }

  void getItems()  {
    final fetchedItems =  repository.getItems();
    items.addAll(fetchedItems);
    notifyListeners();
  }

  Future<void> deleteItem(String info) async {
    await repository.deleteInfo(info);
    items.remove(info);
    notifyListeners();
  }
}
