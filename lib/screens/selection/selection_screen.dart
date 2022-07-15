import 'package:flutter/material.dart';

import '../../components/category_chips.dart';
import '../../components/products.dart';
import '../../components/sub_category_chips.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CategoryChips()),
        Expanded(child: SubCategoryChips()),
        Expanded(child: ProductsWidget()),
      ],
    );
  }
}
