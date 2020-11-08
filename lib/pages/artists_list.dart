import 'package:CodeFury3/components/artist_list_item.dart';
import 'package:CodeFury3/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:CodeFury3/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

final usersRef = Firestore.instance.collection('users');

class ArtistsList extends StatefulWidget {
  final User currentUser;
  ArtistsList({this.currentUser}) ;
  @override
  _ArtistsListState createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {

// void getUsers() async {
//   print("get users");
//   QuerySnapshot snap = await usersRef.where("type", isEqualTo: "work").getDocuments();
  
  
//   print(artists);
//   print("got users");
// }
  
 @override
void initState() {
  super.initState();
  // getUsers();
}

  // List artists = user;

  bool _selected = false;
  // List artists = [
  //   Artist(name: "Gandham Prasanthi", city: "Bangalore", profession: "Painter"),
  //   Artist(name: "K Divyasri", city: "Bangalore", profession: "Dancer"),
  //   Artist(name: "Ananya Kodukule", city: "Bangalore", profession: "Singer"),
  //   Artist(name: "Addy Gupta", city: "Kolkata", profession: "Dancer"),
  //   Artist(name: "Gandham Prasanthi", city: "Bangalore", profession: "Painter"),
  //   Artist(name: "K Divyasri", city: "Bangalore", profession: "Dancer"),
  //   Artist(name: "Ananya Kodukule", city: "Bangalore", profession: "Singer"),
  //   Artist(name: "Addy Gupta", city: "Kolkata", profession: "Dancer"),
  // ];

//  

  int _selectedIndex = 0;
  List<String> _options = [
    'All',
    'Dancer',
    'Singer',
    'Actor',
    'Sculptor',
    'Sketch Artist',
    'Painter'
  ];


  void logout(){
    googleSignIn.signOut();
    Navigator.pop(context);
  }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: TextStyle(color: Colors.black)),
        elevation: 2,
        pressElevation: 1,
        backgroundColor: Colors.white,
        selectedColor: Colors.black12,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Hello,\n",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black87,
                            fontFamily: 'Itim',
                          ),
                          children: [
                            TextSpan(
                              text: widget.currentUser.name.split(" ")[0],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                                color: Colors.black87,
                                fontFamily: 'Itim',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child:
                            Column(
                             children: <Widget>[ 
                               Icon(Icons.message, color: Colors.black, size: 35),
                               SizedBox(height: 0.5),
                               IconButton(
                                 icon:Icon(Icons.exit_to_app, color: Colors.black, size: 35),
                                 onPressed: (){
                                   logout();
                                 }
                                 )
                             ]
                            )
                      ),
                    ]),
              ),
              SizedBox(height: 10),
       
                Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.black, size: 25),
                      SizedBox(width: 5),
                      Container(
                        width: width * 0.7,
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search", border: InputBorder.none),
                            keyboardType: TextInputType.text),
                      )
                    ],
                  ),
                ),
                // Container(
                //     margin: EdgeInsets.only(right: 15),
                //     padding: EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(10)),
                //     child: Icon(Icons.filter_list, color: Colors.white)),
              // ]),

              Container(height: height * 0.1, child: _buildChips()),

              // List
              FutureBuilder<QuerySnapshot>(
                future: usersRef.where("type", isEqualTo: "work").getDocuments(),
                 builder: (context, snapshot){
                   if(!snapshot.hasData){
                     return CircularProgressIndicator();
                   }
                    List<User> artists =[];
                    snapshot.data.documents.forEach((element) {
                      artists.add(User.fromDocument(element));
                    });
                   return Container(
                    padding: EdgeInsets.only(left: 15),
                    height: height * 0.6,
                    child: ListView.builder(
                        itemCount: artists.length,
                        itemBuilder: (context, index) {
                          return ArtistListItem(artist:artists[index], index:index);
                        }));
                      }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
