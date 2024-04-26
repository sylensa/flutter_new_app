import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_app/features/home/home_controller.dart';
import 'package:flutter_new_app/features/home/widget/list_view_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final state = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          ElevatedButton(onPressed: (){
            state.deleteCountry();
          }, child: const Text("Delete"))
        ],
      ),
      body: Column(
        children: [
          Obx(() =>  Expanded(
            child: ListView.builder(
                itemCount: state.listCountries.value.length,
                itemBuilder: (BuildContext context, int index){
                  return  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Obx(() => HomeViewWidget(countyModel: state.listCountries.value[index],)),
                  );


                }),
          ))

        ],
      ),
    );
  }
}
