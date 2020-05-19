// Add the de-serializer

import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/provider/model/serializers.dart';

CountryData parseNationalityResponse(dynamic parsed) {
  return serializers.deserializeWith(CountryData.serializer, parsed);
}