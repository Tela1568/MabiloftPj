
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:io';

class MyappState extends StatefulWidget{
  @override
  MyApp createState() => MyApp();
}
class finalApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MabiloftPage',
        home: MyappState(),
    );
  }
}
class MyApp extends State<MyappState> {


  Widget upperPart =Builder(builder :( context) {
    return Stack(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.only(bottom:30),
          child: (Container(
            padding: const EdgeInsets.all(18),
            color: Colors.deepOrange,
            height: 30,
            child: Row(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(color: Colors.white),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Back', style: TextStyle(color: Colors.white),),
                ),
                Expanded(
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz, color: Colors.white),
                  ),
                ),
              ],
            ),
          ) //per qualche motivo mi da errore se metto la virgola
          ),
        ),


        Center(
          heightFactor: 1.5,
          child: (
          Positioned(
            top: 100,
            child:(
                Container(
                  padding: const EdgeInsets.all(0),
                  //margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      profileImage(context),
                      Text(
                        'Alessio Morale',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '123 follower',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 12),
                      ) //per qualche motivo mi da errore se metto la virgola
                    ],
                  ),
                )     //per qualche motivo mi da errore se metto la virgola
            ),
          )     //per qualche motivo mi da errore se metto la virgola

          ),
        ),
      ],
    );
  });




  Widget moviesTypePart = Align(
      alignment: Alignment.center,
      child:Container(
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'FAVORITE MOVIE\'S GENRES:',
                style: TextStyle(fontSize:10),
              ),
              Column(
                     children:[
                          SingleChildScrollView(
                          padding: EdgeInsets.all(20),
                          scrollDirection: Axis.horizontal,
                          child: (
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _movieType('superHeroes'),
                                _movieType('crime'),
                                _movieType('comedy'),
                                _movieType('adventure'),
                              ],
                            )       //per qualche motivo mi da errore se metto la virgola
                            ),
                          ),
                      ],
                   ),
              ],
        ),
      ),
  );
  Widget movies = Align(
    alignment: Alignment.center,
    child:Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'MY MOVIES:',
            style: TextStyle(fontSize:10),
          ),
          Column(
            children:[
              SingleChildScrollView(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.vertical,
                child: (
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _movie(Color.fromRGBO(233, 93, 47, 1)),
                        _movie(Color.fromRGBO(241, 148, 118, 1)),
                        _movie(Color.fromRGBO(233, 93, 47, 1)),
                      ],
                    )   //per qualche motivo mi da errore se metto la virgola
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );



  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MabiloftPage',
        home: Scaffold(
        body:
        SingleChildScrollView(
          child: (
              Column(
                children: [
                  upperPart,
                  //imagePart,
                  moviesTypePart,
                  movies,
                ],
              )     //per qualche motivo mi da errore se metto la virgola
          ),
        ),
      ),
    );

   }
  }
Widget profileImage(BuildContext context){
  return Stack(
    children: <Widget>[
      CircleAvatar(
        radius:70.0,
        backgroundImage: AssetImage('images/Mabiloftfoto.jpg'),
      ),
      Positioned(
        bottom:20,
        right: 20,
        child: CircleAvatar(
          radius: 13,
          backgroundColor: Colors.deepOrange,
          child: InkWell(
            onTap: (){
              showModalBottomSheet(
                context: context,
                builder: ((builder) => appearingSheet(context)),
              );
            },
            child: (
                Icon(Icons.create,color: Colors.white,size:20)
            ),
          ),
        ),
      ),
    ],
  );
}
Widget appearingSheet(BuildContext context) {
  return Container(
    height: 100,
    width: MediaQuery
        .of(context)
        .size
        .width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: (
        Column(
          children: [
            Text(
              'Choose Profile photo',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () {

                  },
                  tooltip: 'Camera',
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () {

                  },
                  tooltip: 'Gallery',
                ),
              ],
            ),
          ],
        )         //per qualche motivo mi da errore se metto la virgola
    ),
  );
}
Widget _movieType(String str) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 5,right: 5),
    decoration: BoxDecoration(
      color: Color.fromRGBO(253,233,226,0.4),
      borderRadius: BorderRadius.circular(20),
    ),
    child: (
        Text (
          '$str',
          style: TextStyle(fontSize: 14,color: Color.fromRGBO(232, 83, 32, 1)),
        )     //per qualche motivo mi da errore se metto la virgola

    ),
  );
}

Widget _movie(Color color) {
  return Container(
    width: 335,
    height: 152,
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 5,right: 5,bottom: 5, top: 5),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),

    ),
    child: (
    Row(
      children: [
        Container(
          color: color,
          width: 128,
          height: 148,
          margin: EdgeInsets.only(right: 10),
        ),
        Flexible(
          child: (
          Text (
          'Accusamus beatae ad facilis cum similique qui sunt',
          style: TextStyle(fontSize: 14,color: Colors.black),
          )       //per qualche motivo mi da errore se metto la virgola
          ),
        ),

      ],
    )       //per qualche motivo mi da errore se metto la virgola


    ),
  );
}


void main() {
  runApp(finalApp());
}
