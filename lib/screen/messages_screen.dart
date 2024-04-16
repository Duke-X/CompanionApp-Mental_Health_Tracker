import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessagesScreen extends StatelessWidget {
  final List imgs = [
    "doctor1.jpg",
    "doctor2.jpg",
    "doctor3.jpg",
    "doctor4.jpg",
  ];
  MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Messages",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),),
          const SizedBox(height: 30),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.search, color: Colors.tealAccent,)
              ],
            ),
          ),),
          const SizedBox(height: 20,),
          SizedBox(height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Stack(
                  textDirection: TextDirection.rtl,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Image.asset("assets/images/${imgs[index]}",
                        fit: BoxFit.cover,
                        width: 65,
                        height: 65,),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(2),
                      padding: const EdgeInsets.all(3),
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } ,
          ),),
        ],
      ),
    );
  }
}
