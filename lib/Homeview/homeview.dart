import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_application_2/Utils.dart';
import 'package:flutter_application_2/create_todo.dart';
import 'package:flutter_application_2/sharetodotile/todotilewidget.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class TodoHome extends StatefulWidget {
  const TodoHome({ Key? key }) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, dynamic>> completed = [];
  List<Map<String, dynamic>> uncompleted = [];
  List<Map<String, dynamic>> data = [
    {
'title':'Trip to Space',
'description': 'This trip will last a week , and i intend going with you guys',
'date_time':'Tomorrow',
'status':false,
    },
    {
'title':'Trip to Dubai',
'description': 'This trip will last a month, and i intend going with you guys and my mom',
'date_time':'24/12/2021',
'status':false,
    },

     {
'title':'Buy a car',
'description': 'After the trip i intend to buy 2022 latest Model S car in tesla company',
'date_time':'01/01/2022',
'status':false,
    },
    {
'title':'Lunch Kenkey',
'description': 'I want to take kenkey as lunch today at 12:30 pm in ivalley Ghana',
'date_time':'Today',
'status':true,
    },

    ];
    void initState(){
      for(Map<String,dynamic> element in data){
if (element['status']){
  completed.add(element);
}
else{
  uncompleted.add(element);
}
      }
    }
  int count = 3;
  void callback() {
    setState(() {
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: customColor(date: 'appbarcolor'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_img.jpg'),
            radius: 25,
            backgroundColor: Colors.amber,),
        ),
        title: const Text('My Task'),
        actions: const[
          Icon(Icons.menu),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body:ListView.separated(itemBuilder: (context, index) {
        return Todo_Tile();
      },  separatorBuilder: (context, index) {
        return SizedBox(height: 5,);
      },
       itemCount: 2),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return  CreateTodo();
          }));
        } ,
        child: const Icon(Icons.add),
        backgroundColor: customColor(date: 'appbarColor'),),
        bottomNavigationBar: SafeArea(
          child: InkWell(
            onTap:  () {
             showBarModalBottomSheet(
               context: context,
                builder: (context) {
                  return ListView.separated(itemBuilder: (context,  index) {
                    return Todo_Tile();
                  },
                   separatorBuilder: (context, index) {
                     return const SizedBox(
                       height: 5,

                     );
                   },
                    itemCount: 2);
                }); 
            },
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: customColor(
                  date: 'appbarColor',
                  ),
                  borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children:const [
                  Icon(
                    Icons.check_circle_outline_rounded,
                  color:  Colors.white,
                  ),
                Text(
                  'Complete',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  ),
                  Spacer(),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                    )   
                ],
              ),
            ),
          )
    ));
  }
}

