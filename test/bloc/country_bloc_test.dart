import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterappunittest/bloc/nationality_bloc.dart';
import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/event/nationality_event.dart';
import 'package:flutterappunittest/provider/helper/app_exceptions.dart';
import 'package:flutterappunittest/provider/model/serializers.dart';
import 'package:flutterappunittest/repository/mi_repository.dart';
import 'package:flutterappunittest/state/country_state.dart';
import 'package:mockito/mockito.dart';

import '../common/constant.dart';
import '../jsonresponse/country_response.dart';

class MockMiRepository extends Mock implements MiRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MockMiRepository miRepository;
  CountryBloc countryBloc;
  // Create bloc before using it.
  setUp(() async {
    miRepository = MockMiRepository();
    countryBloc = CountryBloc(miRepository: miRepository);
  });
  // Dispose bloc after using it.
  tearDown(() {
    countryBloc?.close();
  });

  test('throws AssertionError when countryBloc is null', () {
    expect(
      () => CountryBloc(miRepository: null),
      throwsAssertionError,
    );
  });

  test('initial state is correct', () {
    expect(CountryInitialState(), countryBloc.initialState);
  });

  test('CompareStates', () {
    CountryDataState resultState = CountryDataState.loading('Fetching data');
    CountryDataState expectedState = CountryDataState.loading('Fetching data');

    expect(expectedState, resultState);
  });

  group('GetCountryList', () {
    CountryData countryData = CountryData();
    countryData = deserialize<CountryData>(countrySucessResponse);
    blocTest(
      'emits [Loading, Complete] when successful',
      build: () async {
        when(miRepository.getCountryDetails())
            .thenAnswer((_) => Future.value(countryData));

        return countryBloc;
      },
      act: (bloc) {
        return bloc.add(LoadCountryData());
      },
      expect: [
        CountryDataState.loading('Fetching Data'),
        CountryDataState.completed('countryData'),
      ],
    );

    blocTest('emits [Loading, Error] when unsuccessful',
        build: () async {
          when(miRepository.getCountryDetails())
              .thenThrow(AppException('Network not available'));
          return countryBloc;
        },
        act: (bloc) => bloc.add(LoadCountryData()),
        expect: [
          CountryDataState.error('Network not available'),
        ]);

    /// Which
    /// Test the selected country and send to voice module
    blocTest(
      'emits [CountrySelectedState()] when [NationalitySelectedEvent()] event is added',
      build: () async => countryBloc,
      act: (bloc) => bloc.add(CountrySelectedEvent()
        ..isSelected = false
        ..country = countries),
      expect: [CountrySelectedState(false, countries)],
    );
  });
}
