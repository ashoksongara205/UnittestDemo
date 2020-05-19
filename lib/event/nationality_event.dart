import 'package:equatable/equatable.dart';
import 'package:flutterappunittest/entity/country_data.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();
}

class LoadCountryData extends CountryEvent {
  @override
  List<Object> get props => [];
}

class CountrySelectedEvent extends CountryEvent {
  bool isSelected;
  Countries country;

  @override
  List<Object> get props => [isSelected, country];
}
