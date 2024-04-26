import 'package:flutter/material.dart';
import 'package:flutter_new_app/features/home/home_controller.dart';
import 'package:flutter_new_app/features/home/home_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeViewWidget extends StatelessWidget {
  final CountyModel countyModel;
  const HomeViewWidget({super.key, required this.countyModel});

  @override
  Widget build(BuildContext context) {
    final state = Get.put(HomeController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.network(countyModel.flags!.svg!, width: 50, height: 50,),
            SizedBox(width: 10,),
            SizedBox(width:100,child: Text(countyModel.name!.common!)),
            SizedBox(width: 10,),
            SizedBox(width: 100,child: Text(countyModel.name!.official!)),
          ],
        ),

        SizedBox(
          width: 50,
          child: Checkbox(value: countyModel.selected, onChanged: (v){
            print("v:$v");
            countyModel.selected = v;
            state.selectedCountry(countyModel);


          },

          ),
        )

      ],
    );
  }
}
