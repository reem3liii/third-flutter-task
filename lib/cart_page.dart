import 'package:flutter/material.dart';
import 'package:efresh_proj/home_page.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget buildCartItem(ItemModel item) => Padding(
    padding: const EdgeInsets.all(10),
    child: Container(
      height: 160,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(item.pic),
            height: 150,
            width: 150,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${item.name}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${item.price}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              width: 10,
            ),
          ),
          Column(
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: (){
                  setState(() {
                    item.quantity++;
                  });
                },
                child: Icon(
                  Icons.add,
                ),
                backgroundColor: Colors.lightGreen,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${item.quantity}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                mini: true,
                onPressed: (){
                  setState(() {
                    if(item.quantity>0)
                      item.quantity--;
                    else{
                      item.inCart = false;
                    }
                  });
                },
                child: Icon(
                  Icons.remove,
                ),
                backgroundColor: Colors.lightGreen,
              ),
            ],
          ),
        ],
      ),
    ),
  );
  List<ItemModel> listItems = inCartItems(items);

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
          'Your Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.lightGreen,
          ),
        ),
      ),
      body: ListView.builder(
            itemBuilder: (context, index)=> buildCartItem(listItems[index]),
            itemCount: listItems.length,
          ),
    );
  }
}

List<ItemModel> inCartItems (List<ItemModel> items){
  List<ItemModel> inCartList = [];
for(var i in items){
  if(i.inCart){
    inCartList.add(i);
  }
}
return inCartList;
}