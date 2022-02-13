// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:listview/Object.dart';

class DetailScreen extends StatelessWidget {
  final FoodItems items;

  DetailScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              child: Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  items.mainphoto,
                  fit: BoxFit.cover,
                ),
              ),
              tag: items.title,
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Text(
                    items.title,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(items.deskripsi),
                  ),
                  Container(
                    height: 150,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: items.photos.map((url) {
                          return Padding(
                            padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(url),
                            ),
                          );
                        }).toList()),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
