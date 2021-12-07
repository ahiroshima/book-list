import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Flavor { development, production }

@immutable
class Constants {
  const Constants._({
    required this.endpoint,
  });

  factory Constants.of() {
    final flavor = EnumToString.fromString(
      Flavor.values,
      const String.fromEnvironment('FLAVOR'),
    );

    switch (flavor) {
      case Flavor.development:
        return Constants._dev();
      case Flavor.production:
      default:
        return Constants._prd();
    }
  }

  factory Constants._dev() {
    return const Constants._(
      endpoint: 'https://www.googleapis.com',
    );
  }

  factory Constants._prd() {
    return const Constants._(
      endpoint: 'https://www.googleapis.com',
    );
  }

  static late final Constants instance = Constants.of();

  final String endpoint;
}

enum SignInMethod { anonymous, email, google }
