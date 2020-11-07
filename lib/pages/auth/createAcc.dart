import 'dart:async';

import 'package:CodeFury3/models/user.dart';
import 'package:CodeFury3/pages/home/home.dart';
import 'package:flutter/material.dart';

class CreateAcc extends StatefulWidget {
  final User user;

  const CreateAcc({this.user});
  
  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
   final skey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();
  final _formW = GlobalKey<FormState>();
  String type="";
  bool typeDone = false;
  List<String> item = ['Actor', 'Musician', 'Sketchers','Dancer', 'Video Editor', 'Photographer'];
  String value ='Actor';
  String projects="";
  String best ="";
  String city ="";

  submit() async {
    final form =_formW.currentState;
    if(form.validate())
    {
      form.save();
      User us = User(
         id: widget.user.id,
         name: widget.user.name,
         email: widget.user.email,
         photoUrl: widget.user.photoUrl,
         type: type,
         prof: value,
         project: projects,
         best: best,
         city: city
         );
      
      await User().addDocument(us);
    SnackBar snackbar= SnackBar(content:Text('Welcome ${widget.user.name}') );
    skey.currentState.showSnackBar(snackbar);
    Timer(Duration(seconds: 2), (){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home(currentUser: widget.user)));
      Navigator.pop(context, us);
    });
  }}

  Widget formW(){
    return SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
      children: [
        Form(
          key: _formW,
          child: Column(
            children: [
              SizedBox(
                  height: 30.0,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Profession: "),
              DropdownButton(
                value: value,
                icon: Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 16,
                // style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  // color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
                items: item.map((e){
                  return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e)
                      );
                }).toList(),
              ),]),
              SizedBox(
                  height: 30.0,
                ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                minLines:2,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: "Your Project names",
                  // labelStyle: TextStyle(
                  //   color: Colors.pink
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
                onChanged: (val)
                  {
                    setState(() {
                      projects = val;
                      });
                  }
                ),
                SizedBox(
                  height: 30.0,
                ),
              TextFormField(
                // keyboardType: TextInputType.multiline,
                // maxLines: 6,
                decoration: InputDecoration(
                  labelText: "Best project youtube video link",
                  // labelStyle: TextStyle(
                  //   color: Colors.pink
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
                onChanged: (val)
                  {
                    setState(() => best = val);
                  }
                ),
            ],
          ), 
            ),
            SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                decoration: InputDecoration(
                  labelText: "City",
                  // labelStyle: TextStyle(
                  //   color: Colors.pink
                  // ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  )
                ),
                onChanged: (val)
                  {
                    setState(() => city = val);
                  }
                ),
            SizedBox(
                  height: 30.0,
                ),
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xffF15D4F))
                ),
                color: Color(0xffF15D4F),
              child: Text("submit",
                style:TextStyle( 
                  color: Colors.white)),
              onPressed: ()async{
                submit();
                }
            )
      ],
    )));
  }

  @override
  Widget build(BuildContext parentContext) {
    
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Create Account'),
        centerTitle: true,
        automaticallyImplyLeading: false
      ),
      body:
      
      typeDone? (type=='hire'? Text('Happy Hiring') : formW()) 
      : 
      Column(
        children: <Widget>[
         Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(
                  height: 30.0,
                ),
                Text("You are : ",
                  style: TextStyle(
                    fontSize: 25.0
                  )
                ),
                SizedBox(
                  height: 20.0,
                ),
                
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.075, vertical: height*0.03),
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      width: width*0.85,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Color(0xffF15D4F))
                          border: Border.all(),
                        ),
                        // height:orientation==Orientation.portrait? height*0.28:height*0.55,
                      child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value:  'hire',
                        groupValue: type,
                          onChanged: (val)
                          {
                            setState(() => type = val);
                          }
                        ),
                        Container(
                        width: width*0.65,
                        child: Column(
                          children:<Widget> [
                            Image.network("https://image.freepik.com/free-vector/recruiting-professionals-studying-candidate-profiles_1262-21404.jpg",
                            width: width*0.65,
                                fit: BoxFit.cover
                              ),
                          Text('a Recuiter',style:TextStyle( 
                              // color: Colors.white
                              fontSize: 19.0
                              ),),
                          ]))
                      ],
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width*0.075, vertical: height*0.02),
                      padding: EdgeInsets.symmetric(vertical: height*0.02),
                      width: width*0.85,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Color(0xffF15D4F))
                          border: Border.all(),
                        ),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value:  'work',
                        groupValue: type,
                          onChanged: (val)
                          {
                            setState(() => type = val);
                          }
                        ),
                        Container(
                        width: width*0.65,
                        child: Column(
                          children:<Widget> [
                            Image.network("https://image.freepik.com/free-vector/person-covering-emotions-searching-identity_74855-5560.jpg",
                            width: width*0.65,
                                fit: BoxFit.cover
                              ),
                          Text('an Artist',
                            style:TextStyle( 
                              // color: Colors.white
                              fontSize: 19.0
                              ),
                              ),
                          ]))
                      ],
                    ),)
                  ]
                )
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xffF15D4F))
                ),
                color: Color(0xffF15D4F),
                onPressed: (){
                  setState((){
                    typeDone = true;
                  });
                  },
                child: Text('Next',
                style:TextStyle( 
                  color: Colors.white),)
              ),
        ],
      )

    );
  }
}