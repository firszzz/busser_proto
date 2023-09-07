import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/busser_logo.svg',
          height: 250,
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Busser – это комфортный и безопасный сервис трансфер-такси.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
            color: Colors.black87,
            border: Border.all(
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.amber,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black54,
              elevation: 0,
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              "Заказать",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
            ),
          ),
        )
      ],
    );
  }
}
