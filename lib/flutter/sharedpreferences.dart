import 'dart:math';

import 'package:basics_dart/flutter/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDemo extends StatefulWidget {
  const SharedPrefDemo({Key? key}) : super(key: key);

  @override
  State<SharedPrefDemo> createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //late SharedPreferences sp;
  late int _buildCount = 0;

  late int _myAsyncRandomNumber;

  // lateinitialization error!
  //late int volumeCache;
  int volumeCache = 0;
  late Future<int> _volF;

  @override
  void initState() {
    super.initState();

    //waitAndInitializeLocals();
    //_incrementBuildCount();
    _volF = getVolumeSP();
  }

  Future<void> waitAndInitializeLocals() async {
    await Future.delayed(const Duration(seconds: 3));
    _myAsyncRandomNumber = Random().nextInt(100);
  }

  Future<void> volumeUp() async {
    final SharedPreferences prefs = await _prefs;

    // diskten okuyup bir arttiriyor,
    // peki daha once yazamadiysa, ya da okuma hatasi alirsa?
    // var volPlusOne = (prefs.getInt('volume') ?? 0) + 1;
    var volPlusOne = ++volumeCache;

    var success = await prefs.setInt('volume', volPlusOne);

    setState(() {
      if (success) _volF = getVolumeSP();
    });

    // setState(() {
    //   _volF = prefs.setInt('volume', newVol).then((bool success) {
    //     return newVol;
    //   });
    // });
  }

  Future<int> getVolumeSP() async {
    final sp = await _prefs;
    // still gives lateinitialization error!!
    volumeCache = sp.getInt("volume") ?? 0;
    return volumeCache;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: const MyAppBar(
        title: Text("SharedPreferences Demo"),
      ),
      body: Column(
        children: [
          Text(
            volumeCache.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       --volume;
            //     });
            //   },
            //   icon: const Icon(Icons.volume_down),
            //   color: Colors.blue[100],
            // ),

            FutureBuilder(
              //future: initSP(),
              future: _volF,
              builder: (context, snapshot) => Text(
                snapshot.data.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),

            IconButton(
              onPressed: volumeUp,
              icon: const Icon(Icons.volume_up),
              color: Colors.blue[100],
            ),
          ])
        ],
      ),
    );
  }
}
