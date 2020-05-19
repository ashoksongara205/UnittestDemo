import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappunittest/entity/country_data.dart';

import 'api_state.dart';

abstract class CountryState {}

@immutable
class CountryDataState extends ApiState with CountryState {
  CountryDataState.loading(message) : super.loading(message);

  CountryDataState.completed(data) : super.completed(data);

  CountryDataState.error(message) : super.error(message);

  @override
  List<Object> get props => [];

  @override
  bool get stringify => false;
}

class CountryInitialState extends Equatable with CountryState {
  @override
  List<Object> get props => [];
}

class CountrySelectedState extends Equatable with CountryState {
  bool isSelected;
  Countries country;

  CountrySelectedState(this.isSelected, this.country);

  @override
  List<Object> get props => [isSelected, country];
}
