import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import "package:http/http.dart" as http;
import "dart:convert" as convert;

class ProfileMaps extends StatelessWidget {
  const ProfileMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      height: (MediaQuery.of(context).size.height / 1.94) / 1.425,
      width: MediaQuery.of(context).size.width / 3.05,
      decoration: BoxDecoration(
        borderRadius: Decorations.borderRadius,
        color: AppColors.white,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: ClipRRect(
        borderRadius: Decorations.borderRadius,
        child: FlutterMap(
            options: MapOptions(
              center: LatLng(14.2770192, 120.7544523),
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                    "{z}/{x}/{y}.png?key={apiKey}",
                additionalOptions: {"apiKey": apiKey},
              ),
              MarkerLayer(markers: [
                Marker(
                    point: LatLng(14.2770192, 120.7544523),
                    builder: (context) =>
                        Icon(Icons.location_on, color: Colors.red, size: 40.0))
              ])
            ]),
      ),
    );
  }
}
