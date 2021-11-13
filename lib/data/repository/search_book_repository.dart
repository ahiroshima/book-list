import 'package:app/data/model/book.dart';
import 'package:app/data/model/result.dart';

abstract class SearchBookRepository {
  Future<Result<Book>> getBook(String);
}