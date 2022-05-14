import 'package:flutter/material.dart';
import 'package:travel/model/travel.dart';

class DetailsView extends StatefulWidget {

  const DetailsView({Key? key, required int id}) : super(key: key);


  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Travel>_travelList = Travel.getTravelItem();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: SizedBox(
            height: size.height,
            width: double.infinity,
            child: FittedBox(
              child: Image.asset(`${_travelList[widget.id].imageUrl[0]}`),
          fit: BoxFit.cover,
            ),
          )),
          Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
            onTap: ()=> Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ),
          )),
          Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap:  ()=>print("more"),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(.3),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Icon(Icons.more_vert, color: Colors.white,),
                  ),
                ),
              )),
          Positioned(child: Container(
            height: size.height*6,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                stops: const [0, 1],
                colors: [Colors.white, Colors.white.withOpacity(.03)]
              )
            ),
          )),
          Positioned(child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("_travelList[index.id].name")
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

