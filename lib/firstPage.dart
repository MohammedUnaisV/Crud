
import 'package:crud/provider/mainProvider.dart';
import 'package:crud/secondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      provider.getData();
    });
    return Scaffold(backgroundColor: Colors.white70,
      appBar: AppBar(backgroundColor:Colors.white,
      centerTitle:true,
        title:  Text("Flutter Registration",
        style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold),),

      ),



      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:30,top:200),
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width:1,color: Colors.black),
                  color:Colors.white
                ),
                child:
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextFormField(
                      controller: value.nameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        hintText: "Enter The Name",
                      ),
                    );
                  }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,top: 20),
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width:1,color: Colors.black),
                    color:Colors.white
                ),
                child:
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return TextFormField(
                      controller: value.placeController,

                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        hintText: "Enter The Place",
                      ),
                    );
                  }
                ),
              ),
            ),
            SizedBox(height:60),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return InkWell(
                  onTap: () {
                    val.addData();
                    val.getData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => secondpage()));
                  },

                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: Colors.black),
                      color: Colors.blue
                    ),
                    child:
                    Center(
                      child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),),
                    ),

                  ),
                );
              }
            ),
          ],
        ),


      ),
    );
  }
}
