import 'package:flutter/material.dart';
import 'package:flutter_application_2/utils.dart';
import 'package:intl/intl.dart';

class CreateTodo extends StatelessWidget {
   CreateTodo({ Key? key }) : super(key: key);
final controllerTitle= TextEditingController();
final controllerDescription= TextEditingController();
final controllerDate= TextEditingController();
final controllerTime= TextEditingController();
final  GlobalKey<FormState> formkey= GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Create Todo'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title require';
                  }
                },
                controller: controllerTitle,
                maxLines: 1,
                decoration:  InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: customColor(date: 'appbarColor')),
                    hintText: 'please type your event',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: customColor(date: 'appbarColor'),
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: customColor(date: 'appbarColor'),
                      )
                    )
                  )
                ),
            ), 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextFormField(
                 validator: (value) {
                   if (value!.isEmpty) {
                     return 'Description require';
                   }
                 },
                 controller: controllerDescription,
                 maxLines: 1,
                decoration:  InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: customColor(date: 'appbarColor')),
                    hintText: 'please type your event',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: customColor(date: 'appbarColor'),
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: customColor(date: 'appbarColor'),
                      )
                    )
                  )
                ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [

                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Date require';
                      }
                    },
                    controller: controllerDate,
                    maxLines: 1,
                    onTap: (){
                      showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                         firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365))
                          ).then((selectDate) {
                            final DateFormat dateformat=DateFormat('dd/MM/yyyy');
                            controllerDate.text=dateformat.format(selectDate!);

                          });
                          },
                    decoration:  InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: customColor(date: 'appbarColor')),
                        hintText: 'Date',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: customColor(date: 'appbarColor'),
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: customColor(date: 'appbarColor'),
                          )
                        )
                      )
                    ),
                ),
                const SizedBox(
                  width: 20,
                ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time require';
                        }
                      },
                      controller: controllerTime,
                      maxLines: 1,
                      onTap: (){
                        showTimePicker(context: context, initialTime: TimeOfDay?.now()).then((selectTime){
                          controllerTime.text = selectTime!.format(context);
                        });
                      },
                    decoration:  InputDecoration(
                      labelText: 'Time',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: customColor(date: 'appbarColor')),
                        hintText: 'Time',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: customColor(date: 'appbarColor'),
                          )
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: customColor(date: 'appbarColor'),
                          )
                        )
                      )
                    ),
                  ),
                   ],
                   
               ),
             ),
           SizedBox(
             width: double.infinity,
             child: ElevatedButton(
               style: TextButton.styleFrom(
                 backgroundColor: customColor(date: 'appbarColor')
               ),
               onPressed: (){
                 if (formkey.currentState!.validate()) {
                   print('successful');
                   print((controllerTitle.text));
                   print(controllerDescription.text);
                   print(controllerDate.text);
                   print(controllerTime.text);
                 }
               },
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
           )
      
          ],),
      ),
      
    );
  }
}