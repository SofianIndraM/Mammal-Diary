import 'package:flutter/material.dart';
import 'package:mammal_diary/models/allmammal_model.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:mammal_diary/ui/widgets/audio_button.dart';
import 'package:mammal_diary/ui/widgets/foods_item.dart';
import 'package:mammal_diary/ui/widgets/photo_item.dart';
import 'package:mammal_diary/ui/widgets/taksonomi_item.dart';

class DetailPageAllMammal extends StatelessWidget {
  final AllMammalModel allmammal;
  const DetailPageAllMammal(this.allmammal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                allmammal.imageUrl,
              ),
              fit: BoxFit.cover),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        margin: EdgeInsets.only(
          top: 236,
        ),
        height: 214,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          children: [
            //Note : EMBLEM
            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              height: 24,
              width: 108,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_emblem.png',
                  ),
                ),
              ),
            ),

            //NOTE: TITLE
            Container(
              margin: EdgeInsets.only(
                top: 256,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allmammal.nama,
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          allmammal.latin,
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AudioButton(
                    suara: allmammal.suara,
                  ),
                ],
              ),
            ),

            //NOTE: DESCRIPTION
            Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: Tentang
                  Text(
                    'Tentang :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    allmammal.tentang,
                    style: blackTextStyle.copyWith(
                      height: 2,
                    ),
                  ),

                  //NOTE: TAKSONOMI
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Taksonomi :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  Column(
                    children: [
                      TaksonomiItem(
                        taksonomi: 'Kerajaan   :  ',
                        nama: allmammal.kerajaan,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Filum          :  ',
                        nama: allmammal.filum,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Kelas          :  ',
                        nama: allmammal.kelas,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Ordo           :  ',
                        nama: allmammal.ordo,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Famili         :  ',
                        nama: allmammal.famili,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Genus        :  ',
                        nama: allmammal.genus,
                      ),
                      TaksonomiItem(
                        taksonomi: 'Spesies      :  ',
                        nama: allmammal.spesies,
                      ),
                    ],
                  ),

                  //NOTE : HABITAT
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Habitat :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    allmammal.habitat,
                    style: blackTextStyle.copyWith(),
                  ),

                  //NOTE : PERSEBARAN
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Peta Persebaran :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          allmammal.persebaran,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //NOTE: HARAPAN HIDUP
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Harapan Hidup :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    allmammal.hidup,
                    style: blackTextStyle.copyWith(),
                  ),

                  //NOTE: WAKTU KEHAMILAN
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Waktu Kehamilan :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    allmammal.hamil,
                    style: blackTextStyle.copyWith(),
                  ),

                  //NOTE: Foto
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Foto-foto :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      //NOTE: FOTO 1
                      PhotoItem(
                        imageUrl: allmammal.foto1,
                      ),
                      //NOTE: FOTO 2
                      PhotoItem(
                        imageUrl: allmammal.foto2,
                      ),
                      //NOTE: FOTO 3
                      PhotoItem(
                        imageUrl: allmammal.foto3,
                      ),
                    ],
                  ),

                  //NOTE: MAKANAN
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Makanan :',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      //NOTE : MAKANAN 1
                      FoodsItem(
                        makanan: allmammal.makanan1,
                      ),
                      FoodsItem(
                        makanan: allmammal.makanan2,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      FoodsItem(
                        makanan: allmammal.makanan3,
                      ),
                      FoodsItem(
                        makanan: allmammal.makanan4,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
