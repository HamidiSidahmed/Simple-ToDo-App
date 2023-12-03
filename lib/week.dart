import 'package:flutter/material.dart';
import 'package:todoapp/box.dart';
import 'package:todoapp/month.dart';
import 'package:todoapp/today.dart';
import 'package:todoapp/weekboxclass.dart';
class thisweek extends StatefulWidget {
  const thisweek({super.key});

  @override
  State<thisweek> createState() => _thisweekState();
}

class _thisweekState extends State<thisweek> {
  bool check_week=false;
  @override
  TextEditingController what_to_do_week=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.deepPurple[50],
          context: context, builder: (context) {
          return 
               Container(
                margin:const EdgeInsets.only(right:15,left: 15,top: 15),
                height: 350,
                child:
                TextField(
                  controller: what_to_do_week,
                  decoration:const InputDecoration(hintText: "write what you want to do",border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  showCursor: true,
                  maxLines: 1,
               onSubmitted: (value1) {
                 setState(() {
                  weektodo.put(what_to_do_week.text, weekboxclass(what_to_do_week.text,check_week));
                  what_to_do_week.clear();
                   
                 });
               },
                  
              )     
        
          );
        },);
      },child: Icon(Icons.add),backgroundColor: Colors.deepPurple,),
     appBar: AppBar(
      actions: [
        IconButton(onPressed: (){
        setState(() {
            weektodo.deleteAll(weektodo.keys);
        });          
        }, icon:const Icon(Icons.delete))
      ],
      backgroundColor: Colors.deepPurple[400],
      title:const Text("To Do This week",style: TextStyle(fontSize: 25),),
      toolbarHeight: 75,
      centerTitle: true,
     ),
     drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: 
          ListView(
            children: [
              const DrawerHeader(child:
               Center(child: Text("What You Need To Do ",style: TextStyle(fontSize: 20),)),
              ),
               ListTile(
                title:const Text("To Do Today",style: TextStyle(fontSize: 16),),
                onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => today(),), (route) => false);
                },
                leading:const Icon(Icons.today_outlined),
              
              ),
              ListTile(
                title:const Text("To Do This week",style: TextStyle(fontSize: 16)),
                onTap: (){
                },
                leading:const Icon(Icons.today_outlined),              
              ),
              ListTile(
                title:const Text("To Do This month",style: TextStyle(fontSize: 16)),
                onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => thismonth(),), (route) => false);

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
itemCount:  weektodo.length,
itemBuilder: (context, index) {
  weekboxclass boxdoweek = weektodo.getAt(index);
return          Container(
            margin: EdgeInsets.only(top: 10,left: 15,right: 15),
            width: 150,
           height: 60,
            decoration:BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(15),color: Colors.deepPurple[200]) ,
                child:
                ListTile(
                 leading: Checkbox(
                  fillColor: MaterialStatePropertyAll(Colors.deepPurple[600]),
                  value: boxdoweek.state, onChanged:(value1) {
                     setState(() {
                      boxdoweek.state=value1!;
                      weektodo.putAt(index, boxdoweek);
                     }); 
                    },),
                    title: Text(boxdoweek.doing,style: TextStyle(decoration:boxdoweek.state ? TextDecoration.lineThrough : null,fontSize: 17),),
                   trailing:  IconButton(onPressed: (){
                    setState(() {
                      weektodo.deleteAt(index);
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