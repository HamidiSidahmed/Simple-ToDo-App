import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/box.dart';
import 'package:todoapp/boxclass.dart';
import 'package:todoapp/month.dart';
import 'package:todoapp/week.dart';
class today extends StatefulWidget {
  const today({super.key});

  @override
  State<today> createState() => _todayState();
}

class _todayState extends State<today> {
  bool check=false;
  @override
  TextEditingController what_to_do=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.blue[50],
          context: context, builder: (context) {
          return 
               Container(
                margin:const EdgeInsets.only(right:15,left: 15,top: 15),
                height: 350,
                child:
                TextField(

                  controller: what_to_do,
                  decoration:const InputDecoration(hintText: "write what you want to do",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  showCursor: true,
                  maxLines: 1,
               onSubmitted: (value) {
                 setState(() {
                  todo.add( boxclass(what_to_do.text,check));
                  what_to_do.clear();
                   
                 });
               },
                  
              )     
        
          );
        },);
      },child:Icon(Icons.add),backgroundColor: Colors.blue,),
     appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
setState(() {
            todo.deleteAll(todo.keys);

});          
        }, icon:const Icon(Icons.delete))
      ],
      backgroundColor: Colors.blue[400],
      title:const Text("To Do Today",style: TextStyle(fontSize: 25),),
      toolbarHeight: 75,
      centerTitle: true,
     ),
      drawer: Drawer(
        backgroundColor: Colors.blue[100],
        child: 
          ListView(
            children: [
              const DrawerHeader(child:
               Center(child: Text("What You Need To Do ",style: TextStyle(fontSize: 20),)),
              ),
               const ListTile(
                title: Text("To Do Today",style: TextStyle(fontSize: 16),),
                leading:Icon(Icons.today_outlined),
              ),
              ListTile(
                title:const Text("To Do This week",style: TextStyle(fontSize: 16)),
                onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => thisweek(),), (route) => false,);
                },
                leading:const Icon(Icons.today_outlined),              
              ),
              ListTile(
                title:const Text("To Do This month",style: TextStyle(fontSize: 16)),
                onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>thismonth(),), (route) => false);

                },
                leading:const Icon(Icons.today_outlined),    
              ),
            ],
          )
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        child:
          ListView.builder(
itemCount:  todo.length,
itemBuilder: (context, index) {
  boxclass boxdo = todo.getAt(index);
return          Container(
            margin:const EdgeInsets.only(top: 10,left: 15,right: 15),
            width: 150,
           height: 60,
            decoration:BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(15),color: Colors.blue[200]) ,
                child:
                ListTile(
                 leading: Checkbox(
                  
                  fillColor: MaterialStatePropertyAll(Colors.blue[800]),
                  value:boxdo.state, onChanged:(value) {
                     setState(() {
                      boxdo.state=value!;
                      todo.putAt(index, boxdo);
                      
                     }); 
                    },),
                    title: Text(boxdo.doing,style: TextStyle(decoration:boxdo.state ? TextDecoration.lineThrough : null,fontSize: 17),),
                   trailing:  IconButton(onPressed: (){
                    setState(() {
                      todo.deleteAt(index);
                    });
                   },icon:const Icon(Icons.remove_circle_outline),), 
                 ), 
                );
}
          )
              )
            
        
      
      
          );  
             
  }
}