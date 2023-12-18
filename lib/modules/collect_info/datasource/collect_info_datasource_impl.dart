import '../../../exports.dart';

class CollectInfoDatasourceImpl implements CollectInfoDatasource {
  final LocalStorageService storage;

  CollectInfoDatasourceImpl(this.storage);
  @override
  Future<void> saveInfo(String info) async {
    List<String> items = [];
    if (storage.contains('info')) {
      final savedItems = storage.read<List<String>>('info');
      items.addAll(savedItems!);
      items.add(info);
      await storage.write('info', items);
      return;
    }
    await storage.write('info', [info]);
  }

  @override
  Future<void> deleteInfo(String info) async {
    List<String> items = [];
    if (storage.contains('info')) {
      final savedItems = storage.read<List<String>>('info');
      items.addAll(savedItems!);
      items.remove(info);
      await storage.write('info', items);
      return;
    }
  }

  @override
  List<String> getItems()  {
    List<String> items = [];
    if (storage.contains('info')) {
      final savedItems = storage.read<List<String>>('info');
      items.addAll(savedItems!);
    }
    return items;
  }
}
