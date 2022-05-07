import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:infopoverka/models/item.dart';

class FavoriteButton extends StatelessWidget {
  final Items item;
  const FavoriteButton({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('tap');
      },
      child: !item.isFavorite
          ? const Icon(
              Icons.star_outline_outlined,
              color: Colors.grey,
            )
          : const Icon(
              Icons.star,
              color: Colors.yellow,
            ),
    );
  }
}
