import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/registration/registration_view_model.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final registrationViewModel = ref.read(registrationViewModelProvider);
    final bookInfo = ref.watch(registrationViewModelProvider.select((value) => value.bookInfo));

    if (bookInfo == null) {
      router.pop();
      return const Scaffold();
    }

    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
            bookInfo.when(success: (data) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      data.title.toString(),
                      style: theme.textTheme.h20.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.subtitle.toString(),
                      style: theme.textTheme.h20.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      data.authors!.isNotEmpty
                        ? data.authors!.first.toString()
                        : '',
                      style: theme.textTheme.h20.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(data.pageCount.toString() + ' ページ'),
                    Text(
                      data.description.toString(),
                      style: theme.textTheme.h20.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        child: networkImage(data.smallThumbnail, fit: BoxFit.fitHeight),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: registrationViewModel.addBook,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              );
            }, failure: (e) {
              return Center(child: Text(l10n.fetchFailed));
            }),
        ],
      ),
    );
  }
}
