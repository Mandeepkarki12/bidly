import 'package:bidly/core/theme/app_color.dart';
import 'package:bidly/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TryPage extends StatefulWidget {
  const TryPage({super.key});

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundPrimary,
        title: Text(
          'Try page',
          style: AppTextStyles().baseBodySpaceMono,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: AppColors.primaryButton,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHover: (value) {
                print('Hover state: $value'); // Debug
                setState(() {
                  _isHovered = value;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hello World!!',
                  style: AppTextStyles().h1SpaceMono.copyWith(
                        fontSize: _isHovered ? 24 : 16,
                        color: _isHovered ? Colors.blue : Colors.black,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
