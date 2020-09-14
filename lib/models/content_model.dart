import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final Color color;


  const Content({
    @required this.name,
    @required this.imageUrl,
    this.title,
    this.price,
    this.description,
    this.color,
  });
}
