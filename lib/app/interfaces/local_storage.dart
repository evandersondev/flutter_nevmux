abstract class ILocalStorage {
  Future<String?> get({required String key});
  Future<void> put({required String key, required String value});
  Future<void> delete({required String key});
}
