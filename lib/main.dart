import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'main_controller.dart';
// By Arpit
// Just Created a simple UI for calculator with 0-9 button and clear button for entering things.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> text = [1,2,3,4,5,6,7,8,9,0,"Clear"];

  final controller = Get.put(MainController());

  void _clearTextView() {
    setState(() {
      controller.calcText = "".obs;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15)),
              height: 100,
              width: double.infinity,
              child:   Obx(() => Text(controller.calcText.value,style: TextStyle(color: Colors.black,height: 10),),
              ),
          ),
                     Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // implement GridView.builder
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10),
                  itemCount: 11,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      margin: EdgeInsets.only(top:10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child:GestureDetector(

                          child: Text(text[index].toString(),style: TextStyle(color: Colors.black),),
                        onTap: (){
                            debugPrint("ontap");

                            if(text[index].toString() == "Clear"){
                              _clearTextView();
                            }else{
                              debugPrint("update");
                             controller.setText(text[index].toString());
                            }

                        },),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }




}
