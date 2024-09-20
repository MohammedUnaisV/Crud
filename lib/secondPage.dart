import 'package:crud/firstPage.dart';
import 'package:crud/3rd%20Page.dart';
import 'package:crud/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: InkWell(onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => firstpage(),));
        },
            child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 5,top: 120),
              child:
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: value.Registrationlist.length,
                    itemBuilder: (context, index) {
                      return
                     Padding(
                       padding: const EdgeInsets.all(5),
                       child: Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 1,color: Colors.black),
                            color: Colors.white
                        ),
                        child:
                        Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => firstpage(),));

                                      },
                                    child: Icon(Icons.edit)),
                                SizedBox(width:20),
                                InkWell(
                                    onTap: () {
                                      value.deleteData(value.Registrationlist[index].id,context);
                                      },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:150,bottom: 2),
                              child:
                              Row(
                                children: [
                                  Text("Name:  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),),
                                  Text(value.Registrationlist[index].name),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:150,bottom: 20),
                              child: InkWell(onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => thirdpage(),));
                              },
                                child: Row(
                                  children: [
                                    Text("Place:  ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),),
                                    Text(value.Registrationlist[index].place)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                                       ),
                     );
                  },

                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
