import 'package:flutter/material.dart';
import 'package:info_keeper/const/app_bar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Contact"),
    );
  }
}
