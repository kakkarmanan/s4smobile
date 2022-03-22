import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Container progress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 10.0),
    child: LoadingAnimationWidget.beat(color: Colors.black, size: 100),
  );
}
