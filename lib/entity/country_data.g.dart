// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Countries> _$countriesSerializer = new _$CountriesSerializer();
Serializer<CountryData> _$countryDataSerializer = new _$CountryDataSerializer();

class _$CountriesSerializer implements StructuredSerializer<Countries> {
  @override
  final Iterable<Type> types = const [Countries, _$Countries];
  @override
  final String wireName = 'Countries';

  @override
  Iterable<Object> serialize(Serializers serializers, Countries object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Countries deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CountryDataSerializer implements StructuredSerializer<CountryData> {
  @override
  final Iterable<Type> types = const [CountryData, _$CountryData];
  @override
  final String wireName = 'CountryData';

  @override
  Iterable<Object> serialize(Serializers serializers, CountryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'result',
      serializers.serialize(object.result,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Countries)])),
    ];

    return result;
  }

  @override
  CountryData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CountryDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'result':
          result.result.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Countries)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$Countries extends Countries {
  @override
  final String name;

  factory _$Countries([void Function(CountriesBuilder) updates]) =>
      (new CountriesBuilder()..update(updates)).build();

  _$Countries._({this.name}) : super._();

  @override
  Countries rebuild(void Function(CountriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountriesBuilder toBuilder() => new CountriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Countries && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Countries')..add('name', name))
        .toString();
  }
}

class CountriesBuilder implements Builder<Countries, CountriesBuilder> {
  _$Countries _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  CountriesBuilder();

  CountriesBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Countries other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Countries;
  }

  @override
  void update(void Function(CountriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Countries build() {
    final _$result = _$v ?? new _$Countries._(name: name);
    replace(_$result);
    return _$result;
  }
}

class _$CountryData extends CountryData {
  @override
  final BuiltList<Countries> result;

  factory _$CountryData([void Function(CountryDataBuilder) updates]) =>
      (new CountryDataBuilder()..update(updates)).build();

  _$CountryData._({this.result}) : super._() {
    if (result == null) {
      throw new BuiltValueNullFieldError('CountryData', 'result');
    }
  }

  @override
  CountryData rebuild(void Function(CountryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CountryDataBuilder toBuilder() => new CountryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CountryData && result == other.result;
  }

  @override
  int get hashCode {
    return $jf($jc(0, result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CountryData')..add('result', result))
        .toString();
  }
}

class CountryDataBuilder implements Builder<CountryData, CountryDataBuilder> {
  _$CountryData _$v;

  ListBuilder<Countries> _result;
  ListBuilder<Countries> get result =>
      _$this._result ??= new ListBuilder<Countries>();
  set result(ListBuilder<Countries> result) => _$this._result = result;

  CountryDataBuilder();

  CountryDataBuilder get _$this {
    if (_$v != null) {
      _result = _$v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CountryData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CountryData;
  }

  @override
  void update(void Function(CountryDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CountryData build() {
    _$CountryData _$result;
    try {
      _$result = _$v ?? new _$CountryData._(result: result.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CountryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
