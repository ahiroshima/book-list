import 'package:app/data/model/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collections.freezed.dart';
part 'collections.g.dart';

@freezed
abstract class Collections with _$Collections {
  factory Collections({
    required String status,
    required int totalResults,
    required List<Collection> col,
  }) = _Collections;

  factory Collections.fromJson(Map<String, dynamic> json) =>
      _$CollectionsFromJson(json);
}
