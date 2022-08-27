import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      ),
      body: SizedBox(
        width: 115,
        height: 115,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/random/400x400/?profile"),
            ),
            Positioned(
              bottom: 0,
              right: -12,
              child: SizedBox(
                width: 40,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.white, width: 3)),
                      padding: const EdgeInsets.all(2)),
                  onPressed: () {},
                  child: const Icon(Icons.favorite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
