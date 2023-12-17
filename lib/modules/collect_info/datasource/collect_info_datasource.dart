abstract interface class CollectInfoDatasource {
  Future<void> saveInfo(String info);
  Future<void> deleteInfo(String info);
  Future<List<String>> getItems();
}
