import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:tflite/tflite.dart';

class KameraPage extends StatefulWidget {
  const KameraPage({Key? key}) : super(key: key);

  @override
  State<KameraPage> createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  File? image;
  var _predictions;
  String label = '';
  String confidence = '';

  @override
  void initState() {
    super.initState();
    loadmodel();
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  detect_image(File image) async {
    final prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _predictions = prediction;
      label = (_predictions![0]['label']).toString().substring(2);
      confidence = (_predictions![0]['confidence']).toString();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      detect_image(imageTemporary);
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        height: 100,
        width: double.infinity,
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
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_monkey.png'),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menu Kamera',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Ketahui jenis hewan mamalia\ndisekitar anda',
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
                  image: AssetImage('assets/icon_monkey.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget foto() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          color: Colors.black,
                        ),
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama :',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              label,
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Confidence :',
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: semiBold,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              confidence,
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.only(bottom: 15),
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        defaultRadius,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icon_monkey.png',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
          ],
        ),
      );
    }

    Widget buttonKamera() {
      return GestureDetector(
        onTap: () => pickImage(ImageSource.camera),
        child: Container(
          margin: EdgeInsets.only(
            top: 18,
          ),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 30,
                ),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_kamera_white.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Ambil Melalui Kamera',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget buttonGaleri() {
      return GestureDetector(
        onTap: () => pickImage(ImageSource.gallery),
        child: Container(
          margin: EdgeInsets.only(
            top: 16,
            bottom: 150,
          ),
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(
              defaultRadius,
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 30,
                ),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_galeri.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Ambil Melalui Galeri',
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              children: [
                header(),
                foto(),
                buttonKamera(),
                buttonGaleri(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
