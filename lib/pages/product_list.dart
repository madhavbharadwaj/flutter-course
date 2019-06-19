import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct,this.deleteProduct);

  Widget _buildEditButton(BuildContext context,int index) {
    return IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return ProductEditPage(
                              product: products[index],
                              updateProduct: updateProduct,
                              productIndex: index);
                        }),
                      );
                    },
                  );

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Dismissible(
        background: Container(color: Colors.red),
            key: Key(products[index]['title']),
            onDismissed: (DismissDirection direction) {
                if(direction == DismissDirection.endToStart){
                  

                  deleteProduct(index);
                } else if(direction == DismissDirection.startToEnd){
                  print("Swiped Start to end");
                }
                else {
                  print("Other swiping");
                }
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]['image']),
                  ),
                  title: Text(products[index]['title']),
                  subtitle: Text('\$${products[index]['price'].toString()}'),
                  trailing: _buildEditButton(context,index),
                ),
                Divider()
              ],
            ),
          ),
      itemCount: products.length,
    );
    // return ListView.builder(

    //   itemBuilder: (BuildContext context, int index) {
    //     ListTile(

    //       leading: Image.asset(products[index]['image']),
    //       title: Text(products[index]['title']),
    //       trailing: IconButton(
    //         icon: Icon(Icons.edit),
    //         onPressed: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(builder: (BuildContext context) {
    //               ProductEditPage(product: products[index]);
    //             }),
    //           );
    //         },
    //       ),
    //     );
    //   },
    //   itemCount: products.length,
    // );
  }
}
