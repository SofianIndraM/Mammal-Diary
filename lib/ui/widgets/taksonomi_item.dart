import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class TaksonomiItem extends StatelessWidget {
  final String taksonomi;
  final String nama;
  const TaksonomiItem({
    Key? key,
    required this.taksonomi,
    required this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Text(
            taksonomi,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          Text(
            nama,
            style: greyTextStyle.copyWith(
              fontWeight: light,
            ),
          ),
        ],
      ),
    );
  }
}
