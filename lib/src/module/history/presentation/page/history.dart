import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/widgets/list_loader_skeletion.dart';
import 'package:app_flutter_starter_for_job/src/module/history/presentation/cubit/history_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HistoryCubit>()..getHistory(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
          backgroundColor: Colors.purple.shade600,
          centerTitle: true,
        ),
        body: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            return state.when(
                initial: () => const Center(child: Text('Ready')),
                loading: () => const CartSkeletonItem(),
                failure: (msg) => Center(child: Text('❌ $msg')),
                error: (String message) {
                  return Center(child: Text(message));
                },
                success: (history) {
                  return SingleChildScrollView(
                    child: SafeArea(
                      child: ListTile(
                        hoverColor: Colors.purple.shade300,
                        leading: const Icon(
                          Icons.history,
                          color: Colors.purple,
                        ),
                        title: const Text(
                          "ເລກໃບບີນ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("code:${history.doc_no}"),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
