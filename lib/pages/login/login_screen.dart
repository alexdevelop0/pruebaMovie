import 'dart:math';




import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pruebaTest/pages/home_page.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool changePage = true;
  String email;
  String password;
  Widget _decorationBox() {
    return Transform.rotate(
        angle: -pi / 5.0,
        child: Container(
          height: 360.0,
          width: 370.0,
          child: Container(
            child: Transform.rotate(
              angle: 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/icon/iconApp.png"),
                        height: 200.0,

                      ),
                    ),
                  ),
              ],),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              gradient: LinearGradient(colors: [
               Colors.white,
                Colors.white,
              ])),
        ));
  }
  final _ediUser = TextEditingController();
final _ediPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(body:


      Container(

        

        child: Column(children: <Widget>[
           SizedBox(height: 70,),
         Container(margin: EdgeInsets.only(left: 30,right: 30),
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/iconApp.png"),
                        height: 150.0,
                        color: Colors.white,

                      ),
                    ),
                  ),
                  SizedBox(height: 70,),

 
          Container(
             margin: EdgeInsets.only(left: 25,right: 25),
                child: Form(key: _formKey,child:Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
 Container(
   height: 70,
   width: double.infinity,
                                    padding: EdgeInsets.all(8.0),
                            
                                    
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Campo requerido";
                                        }
                                        return null;
                                      },
                                      controller: _ediUser,
                                      style: TextStyle(
                                              color: Colors.white),
                                      decoration: InputDecoration(
                                        //  border: InputBorder.none,
                                          hintText: "Usuario",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),


                                  Container(
                 height: 70,
   width: double.infinity,
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Campo requerido";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                       style: TextStyle(
                                              color: Colors.white),
                                      controller: _ediPassword,
                                      decoration: InputDecoration(
                                         // border: InputBorder.none,
                                          hintText: "Contraseña",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
  
                                 
                                  
                                  SizedBox(height: 20,),  
                              
                            
                    _submitButtom(context)
                  ],
                ),
           ) ),
        ]),
      ));



  }




  Widget _submitButtom(BuildContext context) {
    return 
    
   
      
  Container(margin: EdgeInsets.only(left: 20,right: 20),height: 60,width: double.infinity,child:ElevatedButton(
          onPressed: ()  {
            runHome(){
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
            }
          
              showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { Navigator.pop(context);},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Información"),
    content: Text("Datos incorrectos"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
              }


            
        

            if(_formKey.currentState.validate()){
            if(_ediPassword.text == "password" &&_ediUser.text == "maria"  ){
runHome();
            }else{
             if(_ediPassword.text == "123456" &&_ediUser.text == "pedro"  ){
runHome();
            }else{
          showAlertDialog(context);
            }
            }

           
            


            
          }
          },
          
       
          child: Text('Entrar'),
          
           style: ElevatedButton.styleFrom(
              elevation: 0, //Defines Elevation
               primary: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), 
      
      
      
 
    ),
  ),
         
               
        ),
      );
    
  }
}
