import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FoodsItem extends StatelessWidget {
  final String makanan;
  const FoodsItem({
    Key? key,
    required this.makanan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              right: 6,
            ),
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_tulang.png',
                ),
              ),
            ),
          ),
          Text(
            makanan,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
