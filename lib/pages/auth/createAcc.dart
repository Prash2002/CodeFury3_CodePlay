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

  submit() async {
    final form =_form.currentState;
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
         best: best
         );
      
      await User().addDocument(us);
    SnackBar snackbar= SnackBar(content:Text('Welcome ${widget.user.name}') );
    skey.currentState.showSnackBar(snackbar);
    Timer(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(currentUser: widget.user)));
    });
  }}

  Widget formW(){
    return Column(
      children: [
        Form(
          key: _formW,
          child: Column(
            children: [
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
              ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: "Enter the Project names in which you've worked",
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
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
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
      ],
    );
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: skey,
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body:Column(
        children: <Widget>[
         Form(
            key: _form,
            child: Column(
              children: [
                Text("What do you want to do?"),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value:  'hire',
                      groupValue: type,
                        onChanged: (val)
                        {
                          setState(() => type = val);
                        }
                      ),
                      Text('Hire a Talent'),
                    ],
                  ),
                  Row(
                  children: <Widget>[
                    Radio(
                      value:  'work',
                      groupValue: type,
                        onChanged: (val)
                        {
                          setState(() => type = val);
                        }
                      ),
                      Text('Freelance'),
                    ],
                  ),
              ],
            ) ,
              ),
              RaisedButton(
                onPressed: (){
                  setState((){
                    typeDone = true;
                  });
                  },
                child: Text('Next'),
              ),
            typeDone? (type=='hire'? Text('') : formW) : Text('')
        ],
      )

    );
  }
}