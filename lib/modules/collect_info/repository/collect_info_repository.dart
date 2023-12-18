abstract interface class CollectInfoRepository {
  Future<void> saveInfo(String info);
  Future<void> deleteInfo(String info);
  List<String> getItems();
}
