import 'package:app/data/model/books.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/remote/books_data_source.dart';
import 'package:app/data/remote/books_data_source_impl.dart';
import 'package:app/data/repository/books_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksRepositoryProvider = Provider((ref) => BooksRepositoryImpl(ref.read));

class BooksRepositoryImpl implements BooksRepository {
  BooksRepositoryImpl(this._reader);

  final Reader _reader;

  late final BooksDataSource _dataSource = _reader(booksDataSourceProvider);

  @override
  Future<Result<Books>> getBooks() {
    return Result.guardFuture(
      () async => _dataSource.getBooks());
  }
}