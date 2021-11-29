import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/notification/notification_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationPage extends HookConsumerWidget with AutoRouteAware {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final notificationViewModel = ref.read(notificationViewModelProvider);

    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(
      ),
    );
  }
}
