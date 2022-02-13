import 'package:flutter/material.dart';
import 'package:quiddy/src/constants/assets.dart';
import 'package:quiddy/src/constants/colors.dart';
import 'package:quiddy/src/constants/strings.dart';
import 'package:quiddy/src/custom/for_text.dart';
import 'package:quiddy/src/ui/graphic/source/photo_list.dart';
import 'package:quiddy/src/utils/device/device_utils.dart';

class GraphicScreen extends StatelessWidget {
  const GraphicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 0.04)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                forText(
                    title: Strings.promiseTitle,
                    color: Color.fromARGB(255, 149, 199, 175),
                    fontSize: 20),
                Container(
                  height: DeviceUtils.getScaledWidth(context, 0.20),
                  width: DeviceUtils.getScaledWidth(context, 0.20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(Assets.profilPicture),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: DeviceUtils.getScaledWidth(context, 0.30),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: myWidgetList(context),
            ),
          ),
        ],
      ),
    );
  }
}
