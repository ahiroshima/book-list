import 'package:app/foundation/extension/async_snapshot.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/books/books_item.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BooksPage extends HookConsumerWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final homeViewModel = ref.read(booksViewModelProvider);
    final books = ref.watch(booksViewModelProvider.select((value) => value.books));

    final snapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(homeViewModel.fetchBooks);
      }, [books?.toString()]),
    );

    return ContainerWithLoading(
      child: snapshot.isWaiting || books == null
          ? const SizedBox()
          : books.when(success: (data) {
              if (data.articles.isEmpty) {
                return Center(child: Text(l10n.noResult));
              }
              return RefreshIndicator(
                onRefresh: () async => homeViewModel.fetchBooks(),
                child: ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (_, index) {
                    return BookItem(book: data.articles[index]);
                  },
                ),
              );
            }, failure: (e) {
              return Center(child: Text(l10n.fetchFailed));
            }),
    );
  }
}