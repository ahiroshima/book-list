import 'package:app/foundation/extension/async_snapshot.dart';
import 'package:app/data/model/collections.dart';
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
    final collections =
        ref.watch(booksViewModelProvider.select((value) => value.collectios));

    final colsSnapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(booksViewModel.fetchCollections);
      }, [collections?.toString()]),
    );

    final List<Tab> _tabs = [];
    if (colsSnapshot.isWaiting || collections == null) {
      return const SizedBox();
    } else {
      collections.when(
          success: (cols) {
            for (var col in cols.col) {
              _tabs.add(Tab(text: col.name));
            }
          },
          failure: (failure) {});

      return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Icon(Icons.search),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: l10n.searchBook,
                    ),
                  ),
                ),
              ]),
              bottom: TabBar(
                tabs: _tabs,
                onTap: (index) async {},
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    await router.push(const SignInRoute());
                    await booksViewModel.fetchBooks();
                  },
                  icon: const Icon(Icons.login_outlined),
                  iconSize: 30,
                ),
              ],
            ),
            body: TabBarView(
                children: createTabPages(collections.dataOrThrow, ref))),
      );
    }
  }

  List<Widget> createTabPages(Collections collections, WidgetRef ref) {
    final l10n = useL10n();
    final booksViewModel = ref.read(booksViewModelProvider);
    final bookList =
        ref.watch(booksViewModelProvider.select((value) => value.bookList));

    final booksSnapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(booksViewModel.fetchBooks);
      }, [bookList?.toString()]),
    );

    List<Widget> tabPages = [];

    for (var i = 0; i < collections.col.length; i++) {
      tabPages.add(ContainerWithLoading(
        child: booksSnapshot.isWaiting ||
                bookList == null ||
                bookList.dataOrThrow.elementAt(0).totalResults == 0
            ? const SizedBox()
            : bookList.when(success: (data) {
                if (data.elementAt(i).books.isEmpty) {
                  return Center(child: Text(l10n.noResult));
                }
                return RefreshIndicator(
                  onRefresh: () async => booksViewModel.fetchBooks(),
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    children:
                        List.generate(data.elementAt(i).books.length, (index) {
                      return BookItem(book: data.elementAt(i).books[index]);
                    }),
                  ),
                );
              }, failure: (e) {
                return Center(child: Text(l10n.fetchFailed));
              }),
      ));
    }
    return tabPages;
  }
}
