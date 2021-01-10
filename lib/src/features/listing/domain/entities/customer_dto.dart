import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerDto extends Equatable {
  final String name;
  final String iban;
  final String activationDate;

  CustomerDto(
      {@required this.name,
      @required this.iban,
      @required this.activationDate});

  @override
  List<Object> get props => [name, iban, activationDate];
}
