import 'package:drawing_test/drawing/drawing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              text: '그리기 시작',
              onTap: () {
                Get.to(
                  () => const DrawingPage(),
                  binding: BindingsBuilder.put(() => DrawingController()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _button({
    required String text,
    required void Function() onTap,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.limeAccent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12,),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
