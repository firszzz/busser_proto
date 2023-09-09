import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Информация",
          style: TextStyle(
              fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: Border.all(
                      width: 2.5
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _launchUrl(Uri.parse("https://busser.su/rules"));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black54,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Правила перевозок",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(
                        width: 2.5
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchUrl(Uri.parse("https://busser.su/directions"));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Расписание",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(
                        width: 2.5
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchUrl(Uri.parse("https://busser.su/tariffs"));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Text(
                      "Тарифы",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  border: Border.all(
                      width: 2.5
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _launchUrl(Uri.parse("https://zakaz.busser.su/dogovor-oferty"));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black54,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    "Договор оферты",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Image.asset(
                      "assets/website.png"
                  ),
                  onTap: () {
                    _launchUrl(Uri.parse("https://busser.su"));
                  },
                ),
                InkWell(
                  child: Image.asset(
                      "assets/telegram.png"
                  ),
                  onTap: () {
                    _launchUrl(Uri.parse("https://busser.su"));
                  },
                ),
                InkWell(
                  child: Image.asset(
                      "assets/whatsapp.png"
                  ),
                  onTap: () {
                    _launchUrl(Uri.parse("https://busser.su"));
                  },
                ),
                InkWell(
                  child: Image.asset(
                      "assets/vk.png"
                  ),
                  onTap: () {
                    _launchUrl(Uri.parse("https://busser.su"));
                  },
                ),
                InkWell(
                  child: Image.asset(
                      "assets/instagram.png"
                  ),
                  onTap: () {
                    _launchUrl(Uri.parse("https://busser.su"));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
