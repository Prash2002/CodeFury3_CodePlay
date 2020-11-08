import 'package:CodeFury3/models/user.dart';
import 'package:flutter/material.dart';

class ArtistPage extends StatefulWidget {
  final User artist;

  const ArtistPage({this.artist}) ;
  
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.artist.prof),
          // backgroundColor: Colors.white10,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child:  ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80), bottomLeft: Radius.circular(80)),
            child: Image.network(
                // "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                widget.artist.photoUrl,
                width: width ,
                // height: 100,
                fit: BoxFit.cover),
          ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                widget.artist.name.split(" ")[0],
                 style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                                color: Colors.black87,
                                fontFamily: 'Itim',)
              )

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Projects: ',
                  style:TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black87,
                                  
                                  fontFamily: 'Itim',
                                  )
                  ),
                  Text(
                      widget.artist.project,
                       style:TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,)
                    ),
                ],
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: 
                    Row(
                    children: [
                      Text('Best Project: ',
                      style:TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black87,
                                      
                                      fontFamily: 'Itim',
                                      )
                      ),
                      Text(
                          widget.artist.best,
                           style:TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87,)
                        ),
                    ],
            ),
              
              )
          ]
          )
      
    );
  }
  }