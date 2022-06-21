import 'package:flutter/material.dart';
import 'package:mammal_diary/models/artikel_model.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtikelDetailPage extends StatelessWidget {
  final ArtikelModel artikel;
  const ArtikelDetailPage(this.artikel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Text(
            artikel.judul,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            artikel.waktu,
            style: greyTextStyle.copyWith(
              fontWeight: light,
              fontSize: 12,
            ),
          )
        ],
      );
    }

    Widget isi() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              bottom: 16,
            ),
            height: 215,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  artikel.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            artikel.isi,
            style: blackTextStyle,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Sumber :',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          GestureDetector(
            onTap: () async {
              await launch(artikel.sumber);
            },
            child: Text(
              artikel.sumber,
              style: greyTextStyle.copyWith(
                fontWeight: light,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Penulis :',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            artikel.penulis,
            style: greyTextStyle.copyWith(
              fontWeight: light,
              fontSize: 12,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Isi Artikel',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: defaultMargin,
              right: defaultMargin,
              bottom: 50,
            ),
            child: Column(
              children: [
                header(),
                isi(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
