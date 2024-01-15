import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({super.key});

  @override
  State<AddRestaurant> createState() => AddRestaurantState();
}

class AddRestaurantState extends State<AddRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {_getImageFromSource();},
                  child: SizedBox(
                    width: 350,
                    height: 250,
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/8028/8028285.png',
                      fit: BoxFit.contain,
                    ),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getImageFromSource () async {

    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery
    );

    if (pickedFile != null){
      print('Picked File: ${File(pickedFile.path)}');
    }
  }

}
