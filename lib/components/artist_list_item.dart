
import 'package:CodeFury3/models/user.dart';
import 'package:flutter/material.dart';

class ArtistListItem extends StatelessWidget {
  final User artist;
  final int index;
  ArtistListItem({this.artist,this.index});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.only(bottom: 15, right: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(
                  5.0,
                  5.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.network(
                // "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                artist.photoUrl,
                width: width * 0.4,
                height: 100,
                fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(artist.name.split(" ")[0],
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                Row(children: [
                  Icon(Icons.location_on, size: 15),
                  SizedBox(width: 5),
                  Text(artist.city),
                ]),
                Row(children: [
                  Icon(Icons.work, size: 15),
                  SizedBox(width: 5),
                  Text(artist.prof),
                ]),
                // Row(
                //   children: [
                //     Icon(Icons.favorite, size:15),
                //     SizedBox(width:5),
                //     Text("Singer"),
                //   ]
                // ),
              ],
            ),
          ),
        ]),
      );
  }
}