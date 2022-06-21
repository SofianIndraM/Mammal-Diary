import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mammal_diary/cubit/artikel_cubit.dart';
import 'package:mammal_diary/shared/theme.dart';

import '../../models/artikel_model.dart';
import '../widgets/artikel_tile.dart';

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  @override
  void initState() {
    context.read<ArtikelCubit>().fetchArtikel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        height: 100,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(
            defaultMargin,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              width: 30,
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
                  'Menu Artikel',
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Temukan berbagai artikel,\nmenarik mengenai mamalia',
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: 30,
              width: 30,
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
      );
    }

    Widget allArticle(List<ArtikelModel> artikel) {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 20,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Article',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: artikel.map((ArtikelModel artikel) {
                return ArtikelTile(artikel);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<ArtikelCubit, ArtikelState>(
      listener: (context, state) {
        if (state is ArtikelFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: kPrimaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ArtikelSuccess) {
          return ListView(
            children: [
              header(),
              allArticle(state.artikel),
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
