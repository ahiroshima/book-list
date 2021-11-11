import 'package:app/foundation/extension/async_snapshot.dart';
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

    final snapshot = useFuture(
      useMemoized(() {
        return ref
            .read(loadingStateProvider)
            .whileLoading(homeViewModel.scanBarcode);
      }, [scanResult?.toString()]),
    );

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
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter ISBN Code'
              ),
            ),
          ),
          if (scanResult != null)
            Text(scanResult.rawContent),
        ],
      ),
    );
  }

}
