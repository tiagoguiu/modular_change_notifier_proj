abstract interface class CollectInfoDatasource {
  Future<void> saveInfo(String info);
  Future<void> deleteInfo(String info);
  List<String> getItems();
}
