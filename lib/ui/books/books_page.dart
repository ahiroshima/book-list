import 'package:app/foundation/extension/async_snapshot.dart';
import 'package:app/ui/books/books_item.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BooksPage extends HookConsumerWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final booksViewModel = ref.read(booksViewModelProvider);
    final books =
        ref.watch(booksViewModelProvider.select((value) => value.books));

    final snapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(booksViewModel.fetchBooks);
      }, [books?.toString()]),
    );

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(l10n.bookList),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  router.push(const SignInRoute());
                  booksViewModel.fetchBooks();
                },
                icon: const Icon(Icons.login_outlined)),
          ],
        ),
        body: ContainerWithLoading(
          child: snapshot.isWaiting ||
                  books == null ||
                  books.dataOrThrow.totalResults == 0
              ? const SizedBox()
              : books.when(success: (data) {
                  if (data.books.isEmpty) {
                    return Center(child: Text(l10n.noResult));
                  }
                  return RefreshIndicator(
                    onRefresh: () async => booksViewModel.fetchBooks(),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(data.books.length, (index) {
                        return BookItem(book: data.books[index]);
                      }),
                    ),
                  );
                }, failure: (e) {
                  return Center(child: Text(l10n.fetchFailed));
                }),
        ));
  }
}
