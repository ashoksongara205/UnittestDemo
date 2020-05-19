// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/provider/model/serializers.dart';
import 'package:flutterappunittest/repository/mi_repository.dart';
import 'package:mockito/mockito.dart';

import '../jsonresponse/country_response.dart';

class MockMiRepository extends Mock implements MiRepository {}

main() {
  MockMiRepository mockMiRepository;
  setUp(() {
    mockMiRepository = MockMiRepository();
  });

  //---------------------------------------------------------------------------
  /// Which,
  /// Test the country list api
  group("getCountryList", () {
    /// Prepare mock response here
    CountryData countryData = CountryData();
    countryData = deserialize<CountryData>(countrySucessResponse);

    /// Which,
    /// To get (countryList)  success response
    test('Perform get nationality list api ---> Success response', () async {
      // Mock what to return on api
      when(mockMiRepository.getCountryDetails())
          .thenAnswer((_) => Future.value(countryData));
      // Now mock the behavior of making api call so we will get mock response.
      final result = await mockMiRepository.getCountryDetails();
      expect(result, countryData);
    });

    /// Which,
    /// To get (countryList)  error response
    test('Perform get nationality list api --->  Error response', () async {
      // Mock what to return on api
      when(mockMiRepository.getCountryDetails())
          .thenAnswer((_) => Future.value(null));
      // Now mock the behavior of making api call so we will get mock response.
      final result = await mockMiRepository.getCountryDetails();
      expect(result, null);
    });
  });
}
