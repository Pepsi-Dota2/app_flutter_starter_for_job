import 'package:app_flutter_starter_for_job/src/core/config/DI/config.dart';
import 'package:app_flutter_starter_for_job/src/core/router/router.dart';
import 'package:app_flutter_starter_for_job/src/module/customer/presentation/cubit/customer_cubit.dart';
import 'package:app_flutter_starter_for_job/src/module/home/presentation/widgets/search_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => getIt<CustomerCubit>()..fetchCustomers(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("👤 ຂໍ້ມູນຜູ້ໃຊ້"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.amber.shade700,
          ),
          body: BlocBuilder<CustomerCubit, CustomerState>(
            builder: (context, state) {
              return state.when(
                  initial: () => Center(child: CircularProgressIndicator()),
                  loading: () => Center(child: CircularProgressIndicator()),
                  failure: (msg) => Center(child: Text('❌ $msg')),
                  error: (String message) {
                    return Center(
                      child: Text(message),
                    );
                  },
                  success: (customer) {
                    return SafeArea(
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 1.0,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade700,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ຍອດລວມ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Gap(6),
                                  Text(
                                    "₭ 0",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(20),
                          ModernSearchBar(
                            onSearchTap: () {
                              context.router.push(SearchRoute());
                            },
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: customer.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      )),
                                  child: ListTile(
                                    leading: const CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://randomuser.me/api/portraits/men/1.jpg"),
                                      radius: 30,
                                    ),
                                    title: Text(
                                      customer[index].cust_name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(customer[index].address),
                                        Text(
                                          customer[index].adress1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(customer[index].telephone),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          )),
    );
  }
}
