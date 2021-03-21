import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seafood_app/models/user_model.dart';
import 'package:seafood_app/src/pages/home/utility/my_style.dart';

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

  Row buildRowImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () {},
        ),
        Container(
          width: 250,
          height: 250,
          child: Image(
            image: AssetImage('assets/images/image.png'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information'),
      ),
      body: Column(
        children: [buildRowImage(), buildNameShop(), buildMap()],
      ),
    );
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
        decoration: InputDecoration(border: OutlineInputBorder()),
        initialValue: nameShop,
      ),
    );
  }
}
