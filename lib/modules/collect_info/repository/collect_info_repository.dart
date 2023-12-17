abstract interface class CollectInfoRepository {
  Future<void> saveInfo(String info);
  Future<void> deleteInfo(String info);
  Future<List<String>> getItems();
}
