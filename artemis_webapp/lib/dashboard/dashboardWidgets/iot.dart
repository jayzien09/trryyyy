import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class IotEdge extends StatelessWidget {
  const IotEdge({super.key});

  @override
  Widget build(BuildContext context) {
    int connectedDevices = 2;
    return Container(
      padding: const EdgeInsets.all(30),
      height: 300,
      width: MediaQuery.of(context).size.width * 0.18,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: Decorations.borderRadius,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //color: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      //color: Colors.red,
                      height: 30,
                    ),
                    Container(
                      //color: Colors.blue,
                      width: 225,
                      child: Image.asset(
                        'assets/images/iot.png',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(connectedDevices.toString(),
                      style: const TextStyle(
                        color: AppColors.blueAccent,
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(
                    Icons.wifi_rounded,
                    size: 20,
                    color: AppColors.blueAccent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Icon(Icons.power_rounded,
                      size: 20, color: AppColors.greyAccentLine),
                ],
              ),
            ],
          ),
          Text('IoT Edge', style: AppTextStyles.title),
          Text('Environmental tracker', style: AppTextStyles.body),
        ],
      ),
    );
  }
}
