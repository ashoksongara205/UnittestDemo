import 'package:equatable/equatable.dart';
import 'package:flutterappunittest/common/enums.dart';

/// Generic class for the API states
abstract class ApiState<T> extends Equatable {
  final Status status;

  final T data;

  final String message;

  const ApiState.loading(this.message, {this.data}) : status = Status.LOADING;

  const ApiState.completed(this.data, {this.message})
      : status = Status.COMPLETED;

  const ApiState.error(this.message, {this.data}) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  @override
  List<Object> get props => [];

  @override
  bool get stringify => null;
}
