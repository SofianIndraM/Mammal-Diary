import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  const PhotoItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showPhoto() {
      return showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        imageUrl,
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    return GestureDetector(
      onTap: () {
        showPhoto();
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 16,
        ),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
          image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
