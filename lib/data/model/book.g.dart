// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String?,
      author: json['author'] as String?,
      urlToLargeImage: json['urlToLargeImage'] as String?,
      urlToMediumImage: json['urlToMediumImage'] as String?,
      urlToDetailPage: json['urlToDetailPage'] as String?,
      publisher: json['publisher'] as String?,
      publicationDate: json['publicationDate'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'urlToLargeImage': instance.urlToLargeImage,
      'urlToMediumImage': instance.urlToMediumImage,
      'urlToDetailPage': instance.urlToDetailPage,
      'publisher': instance.publisher,
      'publicationDate': instance.publicationDate,
      'price': instance.price,
    };
