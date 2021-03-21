import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seafood_app/models/user_model.dart';
import 'package:seafood_app/src/pages/home/utility/my_constant.dart';
import 'package:seafood_app/src/pages/home/utility/my_style.dart';
import 'package:seafood_app/src/pages/home/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddInformaion extends StatefulWidget {
  final UserModel userModel;
  AddInformaion({@required this.userModel});
  @override
  _AddInformaionState createState() => _AddInformaionState();
}

class _AddInformaionState extends State<AddInformaion> {
  UserModel userModel;
  String nameShop;
  double lat, lng;
  Position position;
  File file;

  @override
  void initState() {
    super.initState();
    userModel = widget.userModel;
    nameShop = userModel.name;
    findLatLng();
  }

  Future<Null> findLatLng() async {
    await findPosition().then((value) {
      setState(() {
        lat = value.latitude;
        lng = value.longitude;
        print('lat = $lat, lng = $lng');
      });
    });
  }

  Future<Position> findPosition() async {
    var position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (e) {
      position = null;
    }
    return position;
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker().getImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
      );
      setState(() {
        file = File(result.path);
      });
    } catch (e) {}
  }

  Row buildRowImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () => chooseImage(ImageSource.camera),
        ),
        Container(
          width: 250,
          height: 250,
          child: file == null
              ? Image(
                  image: AssetImage('assets/images/image.png'),
                )
              : Image.file(file),
        ),
        IconButton(
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () => chooseImage(ImageSource.gallery),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information'),
        actions: [
          IconButton(
              icon: Icon(Icons.cloud_upload),
              onPressed: () => uploadImageAndInsertData())
        ],
      ),
      body: Column(
        children: [buildRowImage(), buildNameShop(), buildMap()],
      ),
    );
  }

  Future<Null> uploadImageAndInsertData() async {
    if (file == null) {
      normalDialog(context, 'No Image For Upload');
    } else if (nameShop.isEmpty) {
      normalDialog(context, 'Name Shop is Empty');
    } else {
      String apiUpload = '${MyConstant().domain}/seafood/saveFile.php';
      int i = Random().nextInt(100000);
      String nameFile = 'user$i.jpg';
      try {
        Map<String, dynamic> map = Map();
        map['file'] =
            await MultipartFile.fromFile(file.path, filename: nameFile);
        FormData data = FormData.fromMap(map);
        await Dio().post(apiUpload, data: data).then((value) async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          String user = preferences.getString('user');

          String urlimage = '/seafood/upload/$nameFile';
          String apiInsert =
              '${MyConstant().domain}/seafood/editUserWhereUser.php?isAdd=true&name=$nameShop&urlimage=$urlimage&lat=$lat&lng=$lng&user=$user';
          await Dio().get(apiInsert).then((value) => Navigator.pop(context));
        });
      } catch (e) {}
    }
  }

  Expanded buildMap() => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: lat == null
              ? Text('Wait')
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(lat, lng),
                    zoom: 16,
                  ),
                  onMapCreated: (controller) {},
                ),
        ),
      );

  Container buildNameShop() {
    return Container(
      width: 250,
      child: TextFormField(
        onChanged: (value) => nameShop = value.trim(),
        decoration: InputDecoration(border: OutlineInputBorder()),
        initialValue: nameShop,
      ),
    );
  }
}
