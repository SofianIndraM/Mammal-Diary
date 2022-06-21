import 'package:flutter/material.dart';
import 'package:mammal_diary/models/allmammal_model.dart';
import 'package:mammal_diary/shared/theme.dart';
import 'package:mammal_diary/ui/pages/detail_page_allmammal.dart';

class MammalDetailsTile extends StatelessWidget {
  final AllMammalModel allmammal;
  const MammalDetailsTile(
    this.allmammal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPageAllMammal(allmammal),
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
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    allmammal.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(
                  defaultRadius,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    allmammal.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    allmammal.latin,
                    style: greyTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
