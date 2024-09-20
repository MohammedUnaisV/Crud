import 'package:crud/secondPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class thirdpage extends StatelessWidget {
  const thirdpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(backgroundColor: Colors.white,
      leading: InkWell(onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => secondpage(),));
      },
          child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1,color: Colors.black),
                  color: Colors.white

                ),
              ),
            ),
          ],
        )

      ),
    );

  }
}
