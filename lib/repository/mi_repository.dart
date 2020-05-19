import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/helper/parser.dart';
import 'package:flutterappunittest/provider/data_provider.dart';
import 'package:flutterappunittest/provider/helper/http_helper.dart';

class MiRepository {
  DataProvider _helper;

  MiRepository({DataProvider provider}) {
    _helper = provider ?? DataProvider();
  }

  Future<CountryData> getCountryDetails() async {
    final response = await _helper.webService(
      'https://api.printful.com/countries',
      enumHttpMethod: HttpMethod.get,
      parser: parseNationalityResponse,
    );
    return response;
  }
}
