import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange_bay/core/utils/app_colors.dart';
import 'package:orange_bay/models/product_response.dart';

class ProductItem extends StatefulWidget {
  final List<ProductResponse> items;
  final int index;
  final List<int> itemCount;
  int cartItemsCount;

  ProductItem({
    super.key,
    required this.items,
    required this.index,
    required this.itemCount,
    required this.cartItemsCount,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(8.r),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: widget.itemCount[widget.index] == 0
              ? Colors.grey
              : AppColors.mainOrange,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Image.network(
                "https://org-bay.runasp.net/images/Product/${widget.items[widget.index].imgUrl.split('/').last}"),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.items[widget.index].name,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 10.sp),
              Text(
                '${widget.items[widget.index].price} \$',
                style: textTheme.labelMedium!.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.darkGrey,
                ),
              )
            ],
          ),
          widget.itemCount[widget.index] == 0
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.itemCount[widget.index] += 1;
                      addItem();
                    });
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.grey[200]),
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    elevation: const WidgetStatePropertyAll(0),
                    side: const WidgetStatePropertyAll(
                      BorderSide(color: AppColors.mainOrange),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                          color: AppColors.mainOrange,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.add_circle_outline_outlined,
                        color: AppColors.mainOrange,
                        size: 20.r,
                      ),
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(8.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.itemCount[widget.index] -= 1;
                            addItem();
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.r,
                          child: Icon(
                            Icons.remove,
                            size: 18.r,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                        child: Text(widget.itemCount[widget.index].toString()),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              widget.itemCount[widget.index] += 1;
                              addItem();
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.r,
                          child: Icon(
                            Icons.add,
                            size: 18.r,
                          ),
                        ),
                      ),
                      // IconButton(onPressed: (){}, icon: c,style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white),padding: MaterialStatePropertyAll(EdgeInsets.all(0)),fixedSize: MaterialStatePropertyAll(Size(20,20)))),
                    ],
                  ),
                )
        ],
      ),
    );
  }

  addItem() {
    widget.cartItemsCount = 0;
    for (int count in widget.itemCount) {
      widget.cartItemsCount += count;
    }
  }
}
