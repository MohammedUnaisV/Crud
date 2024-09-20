import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/registrationModel.dart';
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  final FirebaseFirestore db=FirebaseFirestore.instance;

  TextEditingController nameController=TextEditingController();
  TextEditingController placeController=TextEditingController();

  void addData(){
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String,Object>Data=HashMap();
    Data["User_id"]=id;
    Data["Name"]=nameController.text;
    Data["Place"]=placeController.text;

    db.collection("REGISTRATION").doc(id).set(Data);

    getData();
    notifyListeners();
  }

  List<Registrationmodel> Registrationlist=[];
  void getData(){
    db.collection("REGISTRATION").get().then((value){
      if(value.docs.isNotEmpty){
        Registrationlist.clear();
        for(var element in value.docs){
          Registrationlist.add(Registrationmodel(
              element.id,
              element.get("Name"),
              element.get("Place")));
          notifyListeners();

        }
      }
      notifyListeners();
    }
    );
  }
  void deleteData(String id,BuildContext context ){
    db.collection("REGISTRATION").doc(id).delete();
    getData();
    notifyListeners();
  }


}