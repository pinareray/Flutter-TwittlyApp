import 'package:flutter/material.dart';

class TwitterNotification extends StatefulWidget {
  const TwitterNotification({super.key});

  @override
  State<TwitterNotification> createState() => __TwitterNotificationStateState();
}

class __TwitterNotificationStateState extends State<TwitterNotification> {
  String _image = "https://picsum.photos/200/300";
  String messageNotification = "Hello, this is a fake message. I hope your application will be nice.";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_image),
                    radius: 15,
                  ),
                  //SizedBox(width: 20,)
                  Text("@name", style: TextStyle(),)
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(messageNotification),
                  const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell( 
                      child:Wrap(
                      spacing: 5,
                      children: [
                        Icon(Icons.favorite, color: Colors.pink,),
                        Text("100"),
                      ],
                    ) ,)
                  ],
                )
                ],
              ),
            ),
          );
        } ,
      ),

    );
  }
}