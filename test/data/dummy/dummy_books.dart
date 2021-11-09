import 'package:app/data/model/book.dart';
import 'package:app/data/model/books.dart';

import 'dummy_book.dart';

final dummyBooks = Books(status: 'success', totalResults: 5, books: <Book>[
  dummyBook,
  dummyBook,
  dummyBook,
  dummyBook,
  dummyBook
]);