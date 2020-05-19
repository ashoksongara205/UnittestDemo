import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/event/nationality_event.dart';
import 'package:flutterappunittest/repository/mi_repository.dart';
import 'package:flutterappunittest/state/country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  ///
  /// Section: Public variables
  ///
  final MiRepository miRepository;

  CountryBloc({@required this.miRepository}) : assert(miRepository != null);

  @override
  get initialState => CountryInitialState();

  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is LoadCountryData) {
      // Fetch the data
      yield CountryDataState.loading('Fetching data');
      try {
        /// Get Country List

        CountryData countryData = await miRepository.getCountryDetails();

        yield CountryDataState.completed(countryData);
      } catch (e) {
        yield CountryDataState.error(e.toString());
        print(e);
      }
    } else if (event is CountrySelectedEvent) {
      yield CountrySelectedState(event.isSelected, event.country);
    }
  }
}
