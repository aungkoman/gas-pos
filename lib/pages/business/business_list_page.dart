import 'package:flutter/material.dart';
import 'package:gaspos/pages/business/business_create_page.dart';
import 'package:gaspos/pages/business/business_detail_page.dart';
import 'package:provider/provider.dart';

import '../../models/business.dart';
import '../../providers/business_provider.dart';

class BusinessListPage extends StatefulWidget {
  const BusinessListPage({super.key});

  @override
  State<BusinessListPage> createState() => _BusinessListPageState();
}

class _BusinessListPageState extends State<BusinessListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business List"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BusinessCreatePage(),
              ),
            );
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              leading: Text("${index + 1}"),
              title: Text(Provider.of<BusinessProvider>(context, listen : true).businesses[index].name),
              onTap: (){
                Business currentBusiness = Provider.of<BusinessProvider>(context, listen : false).businesses[index];
                Provider.of<BusinessProvider>(context, listen: false).setSelectedBusiness(business: currentBusiness);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessDetailPage(),
                  ),
                );
              },
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: Provider.of<BusinessProvider>(context, listen : true).businesses.length
        ),
      ),
    );
  }
}
