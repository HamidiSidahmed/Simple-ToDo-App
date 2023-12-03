import 'package:flutter/material.dart';
import 'package:todoapp/box.dart';
import 'package:todoapp/boxclass.dart';
import 'package:todoapp/monthboxclass.dart';
import 'package:todoapp/today.dart';
import 'package:todoapp/week.dart';
class thismonth extends StatefulWidget {
  const thismonth({super.key});

  @override
  State<thismonth> createState() => _thismonthState();
}

class _thismonthState extends State<thismonth> {
  bool check_mounth=false;
  @override
  TextEditingController what_to_do_month=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.pink[50],
          context: context, builder: (context) {
          return 
               Container(
                margin:const EdgeInsets.only(right:15,left: 15,top: 15),
                height: 350,
                child:
                TextField(

                  controller: what_to_do_month,
                  decoration:const InputDecoration(hintText: "write what you want to do",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  showCursor: true,
                  maxLines: 1,
               onSubmitted: (value) {
                 setState(() {
                  monthtodo.put(what_to_do_month.text,monthboxclass(what_to_do_month.text,check_mounth));
                  what_to_do_month.clear();
                 });
               },
                  
              )     
        
          );
        },);
      },child:const Icon(Icons.add),backgroundColor: Colors.pink[600],),
     appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
setState(() {
            monthtodo.deleteAll(monthtodo.keys);
});          
        }
        , icon: Icon(Icons.delete))
      ],
      backgroundColor: Colors.pink[600],
      title:const Text("To Do This Month",style: TextStyle(fontSize: 25),),
      toolbarHeight: 75,
      centerTitle: true,
     ),
      drawer: Drawer(
        backgroundColor: Colors.pink[100],
        child: 
          ListView(
            children: [
              const DrawerHeader(child:
               Center(child: Text("What You Want To Do ",style: TextStyle(fontSize: 20),)),
              ),
               ListTile(
                title:const Text("To Do Today",style: TextStyle(fontSize: 16),),
              
                leading:const Icon(Icons.today_outlined),
              onTap: () {
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => today(),), (route) => false);
              },   
              ),
              ListTile(
                title:const Text("To Do This week",style: TextStyle(fontSize: 16)),
                onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => thisweek(),), (route) => false);
                },
                leading:const Icon(Icons.today_outlined),              
              ),
            const  ListTile(
                title: Text("To Do This month",style: TextStyle(fontSize: 16)),
              
                leading: Icon(Icons.today_outlined),    
              ),
            ],
          )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child:
          ListView.builder(
itemCount:  monthtodo.length,
itemBuilder: (context, index) {
  monthboxclass boxdomonth = monthtodo.getAt(index);
return          Container(
            margin:const EdgeInsets.only(top: 10,left: 15,right: 15),
            width: 150,
           height: 60,
            decoration:BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(15),color: Colors.pink[200]) ,
                child:
                ListTile(
                 leading: Checkbox(
                  fillColor: MaterialStatePropertyAll(Colors.pink[800]),
                  value: boxdomonth.state, onChanged:(value) {
                     setState(() {
                      boxdomonth.state=value!;
                      monthtodo.putAt(index, boxdomonth);

                     }); 
                    },),
                    title: Text(boxdomonth.doing,style: TextStyle(decoration:boxdomonth.state ? TextDecoration.lineThrough : null,fontSize: 17),),
                   trailing:  IconButton(onPressed: (){
                    setState(() {
                      monthtodo.deleteAt(index);
                    });
                   },icon: Icon(Icons.remove_circle_outline),), 
                 ), 
                );
}
          )
              )
            
        
      
      
          );
  }
}