/// API Data Provider Interface class
class ApiDataProviderContract {
  Future<dynamic> get(String url, Function(dynamic) successResponseParser,
      Map<String, String> headers) async {}

}
