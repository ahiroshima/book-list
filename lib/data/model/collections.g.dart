// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Collections _$$_CollectionsFromJson(Map<String, dynamic> json) =>
    _$_Collections(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      col: (json['col'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CollectionsToJson(_$_Collections instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'col': instance.col,
    };
