import 'package:flutter/material.dart';
import 'package:gaspos/providers/business_provider.dart';
import 'package:provider/provider.dart';

class BusinessCreatePage extends StatefulWidget {
  const BusinessCreatePage({super.key});

  @override
  State<BusinessCreatePage> createState() => _BusinessCreatePageState();
}

class _BusinessCreatePageState extends State<BusinessCreatePage> {

  TextEditingController _nameTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Business"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameTec,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter New Business Name',
            ),
          ),
          
          ElevatedButton(onPressed: (){
            Provider.of<BusinessProvider>(context, listen : false).createNewBusiness( name: _nameTec.text);
            Navigator.pop(context);
          }, child: Text("Create New Business"))
          

        ],
      ),
    );
  }
}
