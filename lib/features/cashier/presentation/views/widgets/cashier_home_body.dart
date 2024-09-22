import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/widgets/text_form_field.dart';
import 'package:orange_bay/features/cashier/manager/cashier_manager_cubit.dart';
import 'package:orange_bay/features/cashier/manager/cashier_manager_state.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/cashier_header.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/cashier_home_footer.dart';
import 'package:orange_bay/features/cashier/presentation/views/widgets/product_item.dart';

class CashierHomeBody extends StatefulWidget {
  const CashierHomeBody({super.key});

  @override
  State<CashierHomeBody> createState() => _CashierHomeBodyState();
}

class _CashierHomeBodyState extends State<CashierHomeBody> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CashierManagerCubit>(context);
    return BlocBuilder<CashierManagerCubit, CashierManagerState>(
      buildWhen: (previous, current) => current is GetProductSuccess,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CashierHeader(),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 12,
                        child: AppTextField(
                          controller: searchController,
                          hint: "search",
                          suffix: const Icon(Icons.search),
                          type: TextInputType.text,
                        ),
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisExtent: 300.h,
                        ),
                        itemCount: cubit.productItems.length,
                        itemBuilder: (context, index) {
                          return ProductItem(
                            items: cubit.productItems,
                            index: index,
                            itemCount: cubit.productItemCount,
                            cartItemsCount: cubit.cartItemsCount,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CashierHomeFooter(cartItemsCount: cubit.cartItemsCount),
            ],
          ),
        );
      },
    );
  }
}
