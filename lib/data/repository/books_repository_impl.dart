import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/remote/books_data_source.dart';
import 'package:app/data/remote/books_data_source_impl.dart';
import 'package:app/data/repository/books_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final booksRepositoryProvider =
    Provider((ref) => BooksRepositoryImpl(ref.read));

class BooksRepositoryImpl implements BooksRepository {
  BooksRepositoryImpl(this._reader);

  final Reader _reader;

  late final BooksDataSource _dataSource = _reader(booksDataSourceProvider);

  @override
  Future<Result<Books>> getBooks() {
    return Result.guardFuture(() async => _dataSource.getBooks());
  }

  @override
  Future<Result<Book>> getBook(String id) {
    return Result.guardFuture(() async => _dataSource.getBook(id));
  }
  @override
  Future<Result<void>> addBook(book) {
    return Result.guardFuture(() async => _dataSource.addBook(book));
  }

  @override
  Future<Result<void>> updateBook(book) {
    return Result.guardFuture(() async => _dataSource.updateBook(book));
  }

  @override
  Future<Result<Collections>> getCollections() {
    return Result.guardFuture(() async => _dataSource.getCollections());
  }
}
