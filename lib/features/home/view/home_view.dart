import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motorcycle.svg'),
            SizedBox(width: 10),
            Text(
              '61 Hopper street..',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_outlined, size: 32),
            Spacer(),
            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),
    );
  }
}
