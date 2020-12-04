import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/constants.dart';
import 'package:newsapi/screens/category.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({this.categoryName, this.imageURL});
  final String categoryName;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Category(category: '${categoryName.toLowerCase()}',)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  width: 164.0,
                  height: 84.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text('$categoryName', style: kCategoryNameTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
