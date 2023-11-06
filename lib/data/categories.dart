import 'package:flutter/material.dart';

import "package:shopify/models/category.dart";

const categories = {
  Categories.vegetables: Category(
    type: 'Vegetables',
    color: Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: Category(
    type: 'Fruit',
    color: Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: Category(
    type: 'Meat',
    color: Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: Category(
    type: 'Dairy',
    color: Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: Category(
    type: 'Carbs',
    color: Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: Category(
    type: 'Sweets',
    color: Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    type: 'Spices',
    color: Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: Category(
    type: 'Convenience',
    color: Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    type: 'Hygiene',
    color: Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    type: 'Other',
    color: Color.fromARGB(255, 0, 225, 255),
  ),
};
