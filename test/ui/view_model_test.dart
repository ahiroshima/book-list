import 'package:app/data/model/result.dart';
import 'package:app/data/repository/books_repository_impl.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../data/dummy/dummy_books.dart';
//import '../data/dummy/dummy_book_list.dart';
import '../data/dummy/dummy_collections.dart';
import '../data/repository/fake_books_repository_impl.dart';

class MockBooksRepositoryImpl extends Mock implements BooksRepositoryImpl {}

void main() {
  test('HomeViewModel Test', () async {
    final container = ProviderContainer(
      overrides: [
        booksRepositoryProvider.overrideWithValue(FakeBooksRepositoryImpl())
      ],
    );
    final viewModel = container.read(booksViewModelProvider);
    await expectLater(
        viewModel.fetchCollections(), completion(Result.success(data: dummyCollections)));
    // TODO: テストを追加
    //await expectLater(
    //    viewModel.fetchBooks(), completion(Result.success(data: dummyBookList)));
  });

  test('BooksRepository Test', () async {
    final container = ProviderContainer(
      overrides: [
        booksRepositoryProvider.overrideWithValue(FakeBooksRepositoryImpl())
      ],
    );
    final booksRepository = container.read(booksRepositoryProvider);
    await expectLater(
        booksRepository.getBooks(), completion(Result.success(data: dummyBooks)));
  });
}
