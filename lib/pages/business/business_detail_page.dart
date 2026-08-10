import 'package:flutter/material.dart';
import 'package:gaspos/pages/business/business_edit_page.dart';
import 'package:provider/provider.dart';

import '../../providers/business_provider.dart';

class BusinessDetailPage extends StatefulWidget {
  const BusinessDetailPage({super.key});

  @override
  State<BusinessDetailPage> createState() => _BusinessDetailPageState();
}

class _BusinessDetailPageState extends State<BusinessDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Detail"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BusinessEditPage(),
              ),
            );
          }, icon: Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Text(Provider.of<BusinessProvider>(context, listen: true).selectedBusiness.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 72),),
          Text(Provider.of<BusinessProvider>(context, listen: true).selectedBusiness.description, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),)
        ],
      ),
    );
  }
}
