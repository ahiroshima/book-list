import 'package:app/data/model/book.dart';
import 'package:app/data/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'search_book_data_source.g.dart';

final searchBookDataSourceProvider =
    Provider((ref) => SearchBookDataSource(ref.read));

@RestApi()
abstract class SearchBookDataSource {
  factory SearchBookDataSource(Reader reader) =>
      _SearchBookDataSource(reader(dioProvider));

  @GET('/books/v1/volumes')
  Future<Book> getBook({
    @Query("q") required String query,
    @Query("key") required String apiKey,
  });
}
