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
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: () async {
            bool result = await showConfirmationDialog(context);
            if(result == true){
              int id = Provider.of<BusinessProvider>(context, listen: false).selectedBusiness.id;
              Provider.of<BusinessProvider>(context, listen: false).deleteBusiness(id: id);
              Navigator.pop(context);
            }

          }, icon: Icon(Icons.delete, color: Colors.red,))
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


  Future<bool> showConfirmationDialog(BuildContext context) async {
    // showDialog returns the value passed to Navigator.pop
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false, // User must tap a button to close
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Action'),
          content: const Text('Are you sure you want to proceed with this task?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                // Closes the dialog and returns false
                Navigator.of(context).pop(false);
              },
            ),
            ElevatedButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Closes the dialog and returns true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    // Return false if the dialog was dismissed without a selection
    return result ?? false;
  }

}
