import 'package:app/data/model/book.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    var _memoTextController = TextEditingController();
    final _memoFocusNode = FocusNode();
    _memoFocusNode.addListener(() {
      if (_memoFocusNode.hasFocus) {
        print('フォーカスした : ' + _memoTextController.text);
      } else {
        print('フォーカスが外れた : ' + _memoTextController.text);
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: GestureDetector(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        // 画像
                        networkImage(book.thumbnail, fit: BoxFit.cover),
                        const Gap(50),
                        // タイトル
                        Text(
                          book.title ?? l10n.noTitle,
                          style: theme.textTheme.h50.dense(),
                          overflow: TextOverflow.visible,
                        ),
                        const Gap(10),
                        // サブタイトル
                        Text(
                          book.subtitle ?? '',
                          style: theme.textTheme.h40.dense(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(20),
                        // 概要
                        Text(
                          book.description ?? '',
                          style: theme.textTheme.h30.dense(),
                          overflow: TextOverflow.visible,
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                // 著者
                                child: Text(
                                  book.authors!.isNotEmpty
                                      ? l10n.author + book.authors!.first
                                      : '',
                                  style: theme.textTheme.h30.dense(),
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                // ISBN
                                child: Text(
                                  l10n.isbn + book.isbn.toString(),
                                  style: theme.textTheme.h30.dense(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(children: [
                            Expanded(
                              flex: 5,
                              // ページ数
                              child: Text(
                                l10n.page + book.pageCount.toString(),
                                style: theme.textTheme.h30.dense(),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              // 出版日
                              child: Text(
                                l10n.publicationDate +
                                    (book.publishedDate?.toString() ?? ''),
                                style: theme.textTheme.h30.dense(),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: router.pop,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      // メモ
                      TextField(
                        controller: _memoTextController,
                        focusNode: _memoFocusNode,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: l10n.memo,
                          alignLabelWithHint: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _memoTextController.clear();
                            },
                          ),
                        ),
                        maxLines: null,
                        minLines: 5,
                        onSubmitted: (memo) {
                          print('on Submitted!' + ':' + memo);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
