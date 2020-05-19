import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'country_data.g.dart';

abstract class Countries implements Built<Countries, CountriesBuilder> {
  Countries._();

  factory Countries([updates(CountriesBuilder b)]) = _$Countries;

  static Serializer<Countries> get serializer => _$countriesSerializer;

  @BuiltValueField(wireName: 'name')
  @nullable
  String get name;

}

abstract class CountryData
    implements Built<CountryData, CountryDataBuilder> {
  CountryData._();

  factory CountryData([updates(CountryDataBuilder b)]) =
      _$CountryData;

  static Serializer<CountryData> get serializer =>
      _$countryDataSerializer;

  @BuiltValueField(wireName: 'result')
  BuiltList<Countries> get result;
}
