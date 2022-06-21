import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mammal_diary/cubit/topmammal_cubit.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:mammal_diary/ui/widgets/top_mammal_item.dart';

import '../../models/allmammal_model.dart';
import '../../models/topmammal_model.dart';
import '../widgets/mammal_details_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<TopmammalCubit>().fetchTopMammal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 30,
              bottom: 20,
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_monkey.png',
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Menu Home',
                        style: whiteTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Informasi Mengenai Mamalia',
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_monkey.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Text(
              'Top Mammal',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      );
    }

    Widget topMammal(List<TopMammalModel> topmammal) {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: topmammal.map((TopMammalModel topmammal) {
              return TopMammalItem(topmammal);
            }).toList(),
          ),
        ),
      );
    }

    Widget mammalDetails(List<AllMammalModel> allmammal) {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Mammal Details',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: allmammal.map((AllMammalModel allmammal) {
                return MammalDetailsTile(allmammal);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<TopmammalCubit, TopmammalState>(
      listener: (context, state) {
        if (state is TopmammalFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kPrimaryColor,
              content: Text(
                state.error,
                style: whiteTextStyle,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TopmammalSuccess) {
          return ListView(
            children: [
              header(),
              topMammal(state.topmammal),
              mammalDetails(state.allmammal),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
