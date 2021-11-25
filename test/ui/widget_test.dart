import 'package:app/app.dart';
import 'package:app/data/local/app_user.dart';
import 'package:app/data/model/result.dart';
import 'package:app/foundation/constants.dart';
import 'package:app/ui/component/loading/loading.dart';
import 'package:app/ui/books/books_page.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:app/ui/route/app_route.gr.dart';
import 'package:app/ui/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../data/dummy/dummy_books.dart';

class MockBooksViewModel extends Mock implements BooksViewModel {}

class MockUserViewModel extends Mock implements UserViewModel {}

void main() {
  final mockBooksViewModel = MockBooksViewModel();
  when(mockBooksViewModel.fetchBooks).thenAnswer((_) => Future.value());
  when(() => mockBooksViewModel.books)
      .thenReturn(Result.success(data: dummyBooks));

  final mockUserViewModel = MockUserViewModel();
  when(() => mockUserViewModel.signIn(SignInMethod.anonymous)).thenAnswer((_) => Future.value());
  when(mockUserViewModel.getCurrentUser).thenAnswer((_) => AppUser());
  when(mockUserViewModel.signOut).thenAnswer((_) => Future.value());

  testWidgets('App widget test', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          booksViewModelProvider.overrideWithValue(mockBooksViewModel),
          userViewModelProvider.overrideWithValue(mockUserViewModel),
        ],
        child: const App(),
      ),
    );
  });

  testWidgets('HomePage widget test', (tester) async {
    await mockNetworkImages(() async {
      final appRouter = AppRouter();
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            booksViewModelProvider.overrideWithValue(mockBooksViewModel),
            userViewModelProvider.overrideWithValue(mockUserViewModel),
          ],
          child: MaterialApp.router(
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            routeInformationParser: appRouter.defaultRouteParser(),
            routerDelegate: appRouter.delegate(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(appRouter.current.name == HomeRoute.name, true);
      expect(find.byType(BooksPage), findsOneWidget);
    });
  });

  testWidgets('Loading widget test', (tester) async {
    const loading = Loading();
    await tester.pumpWidget(const ProviderScope(child: loading));
    expect(find.byWidget(loading), findsOneWidget);
  });
}
