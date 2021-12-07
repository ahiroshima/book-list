import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/remote/search_book_data_source.dart';
import 'package:app/data/repository/search_book_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchBookRepositoryProvider =
    Provider((ref) => SearchBookRepositoryImpl(ref.read));

class SearchBookRepositoryImpl implements SearchBookRepository {
  SearchBookRepositoryImpl(this._reader);

  final Reader _reader;

  late final SearchBookDataSource _dataSource =
      _reader(searchBookDataSourceProvider);

  @override
  Future<Result<Book>> getBook(isbn) {
    return Result.guardFuture(
      () async => await _dataSource.getBook(
        query: 'isbn:' + isbn,
        apiKey: const String.fromEnvironment('API_KEY'),
      ),
    );
  }
}
