import 'package:flutter/material.dart';
import 'package:quiddy/src/constants/assets.dart';
import 'package:quiddy/src/ui/video/video_screen.dart';
import 'package:quiddy/src/utils/device/device_utils.dart';

List<String> images = [
  Assets.profilPicture,
  Assets.profilPicture,
  Assets.profilPicture,
  Assets.profilPicture,
];

List<String> videos = [
  Assets.video1,
  Assets.video2,
  Assets.video3,
  Assets.video4,
];

List<Widget> myWidgetList(BuildContext context) {
  var widgetList = <Widget>[];

  for (var i = 0; i < images.length; i++) {
    widgetList.add(videosPhoto(context, images[i], videos[i]));
  }
  return widgetList;
}

GestureDetector videosPhoto(BuildContext context, String photo, String video) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(video),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: DeviceUtils.getScaledWidth(context, 0.03)),
          child: Image.asset(photo)));
}
