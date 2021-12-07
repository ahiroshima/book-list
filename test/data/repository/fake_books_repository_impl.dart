import 'package:app/data/model/books.dart';
import 'package:app/data/model/collections.dart';
import 'package:app/data/model/result.dart';
import 'package:app/data/repository/books_repository_impl.dart';

import '../dummy/dummy_books.dart';
import '../dummy/dummy_collections.dart';

class FakeBooksRepositoryImpl implements BooksRepositoryImpl {
  @override
  Future<Result<Books>> getBooks() async {
    return Result.success(data: dummyBooks);
  }

  @override
  Future<Result<void>> addBook(book) async{
    throw 0;
  }

  @override
  Future<Result<Collections>> getCollections() async {
    return Result.success(data: dummyCollections);
  }
}