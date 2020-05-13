import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {

  String imageUrl;
  String initiales;
  double radius;

  CustomImage(String imageUrl, String initiales, double radius) {
    this.imageUrl = imageUrl;
    this.initiales = initiales;
    this.radius = radius;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (imageUrl == null) {
      return new CircleAvatar(
        radius: radius ?? 0.0,
        backgroundColor: Colors.blue,
        child: new Text(initiales ?? "", style: new TextStyle(color: Colors.white, fontSize: radius)),
      );
    } else {
      ImageProvider provider = CachedNetworkImageProvider(imageUrl);
      if (radius == null) {
        // Image de profil
        return new InkWell(
          child: new Image(image: provider, width: 250.0,),
          onTap: () {
            _showImage(context, provider);
          },
        );
      } else {
        return new InkWell(
          child: new CircleAvatar(
            radius: radius,
            backgroundImage: provider,
          ),
          onTap: () {
            _showImage(context, provider);
          },
        );
      }
    }
  }

  Future<void> _showImage(BuildContext context, ImageProvider provider) {


  }

}