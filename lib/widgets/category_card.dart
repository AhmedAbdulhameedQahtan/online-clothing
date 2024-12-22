import 'package:flutter/material.dart';
import '../resources/color_manager.dart';


class CategoryCard extends StatefulWidget {
  final List category;
  final int index;

  const CategoryCard({super.key, required this.category,required this.index,});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  get category =>widget.category;
  get index => widget.index;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin:const EdgeInsets.all(10),
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        color: ColorsManager.primary ,
        borderRadius:const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          textAlign:TextAlign.center,
          category[index],
          style: Theme.of(context)
              .textTheme
              .headlineMedium),
          ),
    );
  }
}

