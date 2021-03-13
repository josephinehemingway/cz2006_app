import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Eateries/EateriesListPage.dart';
import 'package:flutter_app/screens/Home/HomePage.dart';
import 'package:flutter_app/widgets/bottomNavBar.dart';
import 'package:flutter_app/widgets/customAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller){
    setState(() {

      _markers.add( //add markers here
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(1.3476951854010337, 103.688100402735),
          infoWindow: InfoWindow(
            title: 'NTU Crescent Hall',
            snippet: 'A hall of residence in NTU',
          )
        ),
      );
      _markers.add( //add markers here
        Marker(
            markerId: MarkerId('id-2'),
            position: LatLng(1.3558659321699835, 103.67957206122709),
            infoWindow: InfoWindow(
              title: 'Pasta Express',
              snippet: 'A healthy eatery',
            )
        ),

      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('GoogleMaps', context, HealthyEateries()),
        body: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            _buildContainer(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.eatery));
  }

  Widget _buildContainer(){
    return Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: MediaQuery.of(context).size.width*0.42,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10),
              Padding(padding: const EdgeInsets.all(10.0),
              child: _boxes(
                "https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/4-CZJTRFUVVYMBR6/hero/eef5b5223b4e47fe826903cc14131ae1_1591598479662885781.jpeg",
                  1.3558659321699835, 103.67957206122709,
                "Pasta Express"
              ),
              ),
              SizedBox(width: 8),
              Padding(padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/4-CZJTRFUVVYMBR6/hero/eef5b5223b4e47fe826903cc14131ae1_1591598479662885781.jpeg",
                    1.3484483780466714, 103.68034961859597,
                    "The Crowded Bowl"
                ),
              ),
              SizedBox(width: 8),
              Padding(padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://d1sag4ddilekf6.cloudfront.net/compressed/merchants/4-CZJTRFUVVYMBR6/hero/eef5b5223b4e47fe826903cc14131ae1_1591598479662885781.jpeg",
                    1.344632016183897, 103.68045290273511,
                    "Mr Bean"
                ),
              ),

            ],
          )

        )
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);

      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star_half_outlined,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }


  Widget _buildGoogleMap(BuildContext context) {
    return Container(height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        padding: EdgeInsets.only(
          bottom: 155,
        ),
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(1.3476951854010337, 103.688100402735), //initial location
          zoom: 15,
        ),),
    );
  }



}
