import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_keeper/const/app_bar.dart';
import 'package:info_keeper/const/sizedbox.dart';
import 'package:info_keeper/widget/button.dart';
import 'package:info_keeper/widget/customTextField.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Presonal Information"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ySize(39),
            const CustomTextField(label: "Surname", hintText: "Ayoola"),
            ySize(20),
            const CustomTextField(label: "First Name", hintText: "Idris"),
            ySize(20),
            const CustomTextField(
              label: "Phone Number",
              hintText: "+234903948378",
              inputType: TextInputType.number,
            ),
            ySize(200),
            LoginButton(text: "SAVE CHANGES", onPressed: () {}, isLogin: true),
            ySize(20),
          ],
        ),
      ),
    );
  }
}
