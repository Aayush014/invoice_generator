import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCD6F7),
      appBar: AppBar(
        backgroundColor: const Color(0xff424874),
        leading: const Icon(CupertinoIcons.house_fill,color: CupertinoColors.white,),
        title: const Text("Home Screen",style: TextStyle(color: CupertinoColors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff424874),
            onPressed: () => Navigator.of(context).pushNamed('add'),
            child: const Text("Generate Invoice",style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.bold,fontSize: 22),),
          ),
        ),
      ),
    );
  }
}
