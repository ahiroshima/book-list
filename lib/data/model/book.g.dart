// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      isbn: json['isbn'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      authors: json['authors'] as List<dynamic>?,
      publishedDate: json['publishedDate'] as String?,
      description: json['description'] as String?,
      pageCount: json['pageCount'] as int?,
      categories: json['categories'] as List<dynamic>?,
      smallThumbnail: json['smallThumbnail'] as String?,
      thumbnail: json['thumbnail'] as String?,
      urlToDetailPage: json['urlToDetailPage'] as String?,
      publisher: json['publisher'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'pageCount': instance.pageCount,
      'categories': instance.categories,
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
      'urlToDetailPage': instance.urlToDetailPage,
      'publisher': instance.publisher,
      'price': instance.price,
    };
