import 'helper/http_helper.dart';
import 'interfaces/api_provider_contract.dart';
import 'providers/api_provider.dart';

class DataProvider {
  ApiDataProviderContract _apiDataProviderContract;

  DataProvider() {
    _apiDataProviderContract =
        ApiDataProvider.initialize(); // Provide the concrete implementation
  }

  /// Method to handle web API calls
  Future webService(String url,
      {dynamic body,
      Function(dynamic) parser,
      Map<String, String> headers,
      HttpMethod enumHttpMethod,
      bool isUsingDio = false}) async {
    if (enumHttpMethod == HttpMethod.get) {
      if (!isUsingDio) {
        return parser != null ??
            _apiDataProviderContract.get(url, parser, headers);
      }
    }
  }

  /// Method to handle local data
  Future localService() {
    return null;
  }
}
