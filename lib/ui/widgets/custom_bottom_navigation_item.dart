import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mammal_diary/cubit/page_cubit.dart';

import '../../shared/theme.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;

  final String title;
  final int index;
  const CustomBottomNavigationItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kWhiteColor
                : kInactiveColor,
          ),
          Text(
            title,
            style: context.read<PageCubit>().state == index
                ? whiteTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                  )
                : transparentTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: light,
                  ),
          )
        ],
      ),
    );
  }
}
