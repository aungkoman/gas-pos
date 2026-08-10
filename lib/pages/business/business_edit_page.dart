import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/business_provider.dart';

class BusinessEditPage extends StatefulWidget {
  const BusinessEditPage({super.key});

  @override
  State<BusinessEditPage> createState() => _BusinessEditPageState();
}

class _BusinessEditPageState extends State<BusinessEditPage> {



  final TextEditingController _nameTec = TextEditingController();
  final TextEditingController _descriptionTec = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTec.text = Provider.of<BusinessProvider>(context, listen: false).selectedBusiness.name;
    _descriptionTec.text = Provider.of<BusinessProvider>(context, listen: false).selectedBusiness.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Business Info"),
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
          TextField(
            controller: _descriptionTec,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter New Business Description',
            ),
          ),

          ElevatedButton(onPressed: (){
            int id = Provider.of<BusinessProvider>(context, listen: false).selectedBusiness.id;
            Provider.of<BusinessProvider>(context, listen : false).updateBusiness(id: id, name: _nameTec.text, description: _descriptionTec.text);
            Navigator.pop(context);
          }, child: Text("Update Business"))
        ],
      ),
    );
  }
}
