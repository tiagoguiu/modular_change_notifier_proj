import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_change_notifier_proj/exports.dart';

class StorageMock extends Mock implements LocalStorageService {}

void main() async {
  final LocalStorageService storage = StorageMock();
  final CollectInfoDatasource datasource = CollectInfoDatasourceImpl(storage);
  final CollectInfoRepository repository = CollectInfoRepositoryImpl(datasource);

  test(
    'Should save an item and check',
    () async {
      const String item = 'Testing saved item';
     when(()  =>  storage.write('info', [item])).thenAnswer(
        (_) async => await Future.delayed(
          const Duration(milliseconds: 200),
        ),
      );
      when(() => storage.read<List<String>>('info')).thenReturn([item]);
      when(() => storage.contains('info')).thenReturn(false);

      await repository.saveInfo(item);

      when(() => storage.contains('info')).thenReturn(true);
      final items = repository.getItems();
      final shouldCorrect = items.contains(item);
      expect(shouldCorrect, equals(true));
    },
  );
}
