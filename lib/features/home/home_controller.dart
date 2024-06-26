import 'dart:developer';

import 'package:flutter_new_app/core/network/htpp_calls.dart';
import 'package:flutter_new_app/features/home/home_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  HttpCalls httpCalls = HttpCalls();
  final Rx<List<CountyModel>> listCountries = Rx<List<CountyModel>>([]);
  final Rx<List<CountyModel>> selectedCountries = Rx<List<CountyModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getHomeData();

  }
  getHomeData()async{
    List<dynamic> response  =  await httpCalls.doGet("https://restcountries.com/v3.1/all?fields=name,flags");
    listCountries.value = response.map((e) => CountyModel.fromJson(e)).toList();
    log("response:${listCountries.value}");
  }

  deleteCountry(){
    for(int i =0; i <selectedCountries.value.length; i++){
      for(int t = 0; t < listCountries.value.length; t++){
        if(listCountries.value[t].name == selectedCountries.value[i].name){
          listCountries.value.removeAt(t);
          listCountries.refresh();
          selectedCountries.refresh();
        }
      }
    }


  }
  selectedCountry(CountyModel countyModel){
      for(int t = 0; t < listCountries.value.length; t++){
          if(listCountries.value[t].name == countyModel.name){
            listCountries.value[t] = countyModel;
            selectedCountries.value.add(countyModel);
          }
      }
      listCountries.refresh();
      selectedCountries.refresh();
  }
}

