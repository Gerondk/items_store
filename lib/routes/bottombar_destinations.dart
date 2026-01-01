import 'package:flutter/material.dart';

class BottombarDestination {
  final String label;
  final IconData icon;

  BottombarDestination(this.label, this.icon);
}

final bottomDestinations = [
  BottombarDestination('products', Icons.search),
  BottombarDestination('Bookmarked', Icons.bookmark_border),
];
