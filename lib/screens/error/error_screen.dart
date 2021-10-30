import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar_widget.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Error"),
    );
  }
}
