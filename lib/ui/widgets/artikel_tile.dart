import 'package:flutter/material.dart';
import 'package:mammal_diary/models/artikel_model.dart';
import 'package:mammal_diary/shared/theme.dart';

import '../pages/artikel_detail_page.dart';

class ArtikelTile extends StatelessWidget {
  final ArtikelModel artikel;
  const ArtikelTile(
    this.artikel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArtikelDetailPage(artikel),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kGreyColor.withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(7.0, 10.0),
            ),
          ],
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 16,
              ),
              height: 120,
              width: 120,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artikel.judul,
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    artikel.waktu,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
