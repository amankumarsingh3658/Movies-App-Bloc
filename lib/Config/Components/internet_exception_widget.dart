import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  InternetExceptionWidget({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.15,
        ),
        Icon(
          Icons.cloud_off_outlined,
          color: Colors.red,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "We are unable to show results.\nPlease Check Your Internet Connection",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14),
          ),
        ),SizedBox(height: height*0.1,),
        ElevatedButton(onPressed: onPress, child: Text("Retry"))
      ],
    );
  }
}
