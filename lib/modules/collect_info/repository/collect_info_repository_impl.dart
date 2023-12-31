import '../../../exports.dart';

class CollectInfoRepositoryImpl implements CollectInfoRepository {
  final CollectInfoDatasource datasource;

  CollectInfoRepositoryImpl(this.datasource);
  @override
  Future<void> saveInfo(String info) async {
    await datasource.saveInfo(info);
  }

  @override
  Future<void> deleteInfo(String info) async {
    await datasource.deleteInfo(info);
  }

  @override
  List<String> getItems()  {
    return  datasource.getItems();
  }
}
