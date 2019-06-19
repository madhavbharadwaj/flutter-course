import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';


class ProductsAdminPage extends StatelessWidget {



  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text("Choose"),
                  automaticallyImplyLeading: false,
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text("All Products"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                )
              ],
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text("Manage Products"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  child: Text("Create Product"),
                ),
                Tab(
                  icon: Icon(Icons.list),
                  child: Text("My Products"),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductEditPage(),
              ProductListPage()
            ],
          )),
    );
  }
}
