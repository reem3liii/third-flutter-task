import 'package:efresh_proj/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:efresh_proj/home_page.dart';

class ItemPage extends StatefulWidget {
  final ItemModel item;
  const ItemPage({required this.item});
  @override
  _ItemPageState createState() => _ItemPageState(item);
}

class _ItemPageState extends State<ItemPage> {
  final ItemModel item;
  _ItemPageState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.lightGreen,
          ),
        ) ,
        title: Text(
          'eFresh',
          style: TextStyle(
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> CartPage(),
                    )
                );
              });
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(item.pic),
                    //fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${item.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${item.kg}KG',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$${item.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          TextButton(
              onPressed: (){
                setState(() {
                  item.inCart = true;
                  item.quantity = 1;
                });
              },
              child: Container(
                color: item.inCart? Colors.grey: Colors.lightGreen,
                width: double.infinity,
                height: 75,
                child: Center(
                  child: Text(
                    '${item.inCart?'Added':'Add To Cart'}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: item.inCart? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}

