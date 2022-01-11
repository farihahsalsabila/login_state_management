import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomePageProvider(context),
      child:Scaffold(
        appBar: AppBar(
          title: Text('List User'),
        ),
        body: Consumer<HomePageProvider>(
          builder: (BuildContext context, value, Widget? child){
            return ListView.builder(
            itemCount: value.users.length,
            itemBuilder: (context, index){
              var itemUser = (value.users[index]);

              return Card(
                child: ListTile(
                  title: Text(itemUser['email'] ?? '-'),
                  subtitle: Text(itemUser['first_name'] ?? '-'),
                ),
              );
            },
          );
        },
      )
      ),
    );
  }
}
