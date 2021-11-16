// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Books _$$_BooksFromJson(Map<String, dynamic> json) => _$_Books(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BooksToJson(_$_Books instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'books': instance.books,
    };
