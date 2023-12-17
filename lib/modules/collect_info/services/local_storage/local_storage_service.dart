abstract interface class LocalStorageService {
  Future<void> init();
  T? read<T>(String key);
  Future<void> write<T>(String key, T value);
  Future<void> remove(String key);
  bool contains(String key);
  void clear({required bool areYouSure});
}
