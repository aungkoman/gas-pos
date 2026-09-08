import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/branch_provider.dart';

class BranchListPage extends StatefulWidget {
  const BranchListPage({super.key});

  @override
  State<BranchListPage> createState() => _BranchListPageState();
}

class _BranchListPageState extends State<BranchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Branch List Page"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(Provider.of<BranchProvider>(context, listen:true).branches[index].name),
          ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: Provider.of<BranchProvider>(context, listen:true).branches.length
      ),
    );
  }
}
