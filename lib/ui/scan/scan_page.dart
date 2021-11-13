import 'package:app/foundation/extension/async_snapshot.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/component/loading/container_with_loading.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/loading_state_view_model.dart';
import 'package:app/ui/scan/scan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScanPage extends HookConsumerWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final homeViewModel = ref.read(scanViewModelProvider);
    final scanResult = ref.watch(scanViewModelProvider.select((value) => value.scanResult));
    final bookInfo = ref.watch(scanViewModelProvider.select((value) => value.bookInfo));

    final BorderRadius borderRadiusTop = const BorderRadius.only(
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );

//    final snapshot = useFuture(
//      useMemoized(() {
//        return ref
//            .read(loadingStateProvider)
//            .whileLoading(homeViewModel.searchBook);
//      }, [bookInfo?.toString()]),
//    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('ISBNスキャン'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera),
            tooltip: 'Scan',
            onPressed: homeViewModel.scanBarcode,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter ISBN Code',
              ),
              onSubmitted: homeViewModel.searchBook,
            ),
          ),

          if (bookInfo != null)
            bookInfo.when(success: (data) {
              return Center(
                child: Column(
                  children: [
                    Text(data.title.toString()),
                    Text(data.subtitle.toString()),
                    Text(data.authors!.isEmpty ? '' : data.authors!.first.toString()),
                    Text(data.pageCount.toString()),
                    //Text(data.description.toString()),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: borderRadiusTop,
                        child: networkImage(data.smallThumbnail, fit: BoxFit.fitHeight),
                      ),
                    ),
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
