import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/model/travel.dart';

import 'details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
   List<Travel> _travelList = Travel.getTravelItem();
   List<Travel> _nearestListTravelList = Travel.getTravelItem();
    return Scaffold(
      appBar: AppBar(
     title:  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Image.asset("assets/images/download.png", width: 30,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/download.png", width: 20),
                const SizedBox(width: 2),
                Text("London", style: const TextStyle(
                  color: Color(0xff8f294f),
                  fontSize: 16.0
                ),),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xff8f294f),)
              ],
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20)
              ),
              child: Image.asset("assets/images/download.png", width: 40, height: 40,),
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             RichText(
               text: TextSpan(
                 text: "Discover",
                 style: const  TextStyle(
                   color: Color(0xff8f294f),
                   fontSize: 32,
                   height: 1.3
                 ),
                 children: <TextSpan> [
                   TextSpan(text: "The Best Places to Travel", style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.black.withOpacity(.8)
                   ))
                 ]

               ),
             ),
             Container(
               margin: const EdgeInsets.symmetric(vertical: 20),
               padding:  const  EdgeInsets.symmetric(horizontal: 15.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Image.asset("assets/images/download.png", width: 24,),
                 const  SizedBox(width: 15,),
                 const  Expanded(child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search places"
                    ),
                  ) 
                 ),
                Image.asset("assets/images/download.png", width: 24,)
                 ],
               ),
               decoration: BoxDecoration(color: Colors.black.withOpacity(0.1),
               borderRadius: const BorderRadius.all(Radius.circular(12))
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const  Text("Nearest to you", style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w600
                 ),),
                 const  Text("View all", style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Color(0xff8f294f)
                 ),),
               ],
             ),
             Container(
               margin: const EdgeInsets.only(top: 16),
               height: size.height * .4,
               child: ListView.builder(
                   itemCount: _nearestListTravelList.length,
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(padding: EdgeInsets.only(right: 16.0),
                       child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsView(id: index)
                            ));
                            Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(24),),
                                    child: Image.asset(
                                        _nearestListTravelList[index]
                                            .imageUrl[0])
                                ),
                                Positioned(
                                    left: 20,
                                    bottom: 20,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(0, 0, 0, 5),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),)
                                      ),
                                      child: Text(
                                        _nearestListTravelList[index].distans
                                            .toString() + "km away",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),),
                                    ))
                              ],

                            );
                          })
                     );
                   } ),
             ),
           const   SizedBox(height: 24),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text("Discover Places", style: const TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.w600
                 ),),
                 const Text("View all", style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: const  Color(0xff8f294f)
                 ),),
               ],
             ),
             Container(
               margin: const EdgeInsets.only(top: 16),
               height: size.height * .4,
               child: ListView.builder(
                   itemCount: _travelList.length,
                   itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding:  const  EdgeInsets.only(bottom: 15.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsView(id: index)
                          ));
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(_travelList[index].imageUrl[0], fit: BoxFit.fill, height: 60.0,),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Text(_travelList[index].name, style: const TextStyle(
                                 fontSize: 20,
                                 fontWeight: FontWeight.w600
                               ),),
                                const SizedBox(height: 8.0),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(_travelList[index].location, style: const  TextStyle(
                                     fontSize: 16.0,
                                     color: const Color(0xff686771),
                                   ),),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Image.asset("assets/images/download.png" , width: 40,),
                                       Text(_travelList[index].rating.toString(), style: const TextStyle(
                                         fontSize: 16.0
                                       ),)
                                     ],
                                   ),
                                 ],
                               )
                              ],
                            ))
                          ],
                        ),
                      ) ,
                    );
                   }),
             )
           ],
          ),
        ),
      ),
    );
  }
}
