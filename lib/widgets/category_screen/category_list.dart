import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_provider/models/database_provider.dart';
import 'package:sqlite_provider/widgets/category_screen/category_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var list = db.categories;
        return ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: list.length,
            itemBuilder: (_, i) => CategoryCard(list[i]));
      },
    );
  }
}
