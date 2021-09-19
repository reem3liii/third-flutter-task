import 'package:efresh_proj/item_page.dart';
import 'package:flutter/material.dart';

class ItemModel
{
  final String name;
  final pic;
  final int kg;
  final double price;
  var inCart =false;
  var quantity = 0;

  ItemModel({
    required this.name,
    required this.pic,
    this.kg = 1,
    required this.price
  });
}

List<ItemModel> items= [
  ItemModel(name:'Apples', pic: 'https://grocery11.com/wp-content/uploads/2021/04/apple-fruit-500x500-1.jpg', price: 4.5),
  ItemModel(name: 'Bananas', pic: 'https://cdn.shopify.com/s/files/1/0065/1637/5588/products/Banana_Cavendish_69aef9c9-870b-4d36-a90d-789496eb44f4.jpg?v=1551751469', price: 3.65),
  ItemModel(name: 'Tomatoes', pic: 'https://www.localcrop.com.au/856-thickbox_default/tomatoes-500g.jpg', price: 5.2),
  ItemModel(name: 'Carrots', pic: 'https://zonefresh.com.au/wp-content/uploads/CARROTS-BAGGED.png', price: 2.8),
  ItemModel(name: 'Cucumbers', pic: 'https://static.libertyprim.com/files/varietes/concombre-hollandais-large.jpg?1569524167', price: 3.5),
  ItemModel(name: 'Lettuce', pic: 'http://www.entekart.com/image/cache/catalog/Products/Home%20Essentials/Vegetables/Lettuce%20online%20near%20me-1200x1200.jpg',price: 7.2),
  ItemModel(name: 'Oranges', pic: 'https://nippys.com.au/site/wp-content/uploads/2016/11/Orange_Shutterstock_600x600-600x600.jpeg', price: 8.3),
  ItemModel(name: 'Grapes', pic: 'https://sc04.alicdn.com/kf/U628143a30ac04573a9f428b1d10477ae6.jpg', price: 6.5),

];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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

              },
              icon: Icon(
                Icons.search,
              ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: NetworkImage('https://static.onecms.io/wp-content/uploads/sites/20/2021/03/01/fruits-veggies1-2000.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Free Deleviry',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    'Near Me',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                  ),
                ),
              ],
            ),
          ),
           Padding(
             padding: const EdgeInsets.symmetric(
               horizontal: 20,
             ),
             child: Text(
               'Fresh Sale',
               style: TextStyle(
                 color: Colors.lightGreen,
                 fontSize: 25,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 280,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index)=> GestureDetector(
                    child: buildItem(items[index]),
                  onTap: (){
                      setState(() {
                        Navigator.push(
                            context,
                        MaterialPageRoute(
                            builder: (context)=> ItemPage(item: items[index]),
                        )
                        );
                      });
                  },
                ),
                separatorBuilder: (context, index)=> SizedBox(
                  width: 16,
                ),
                itemCount: items.length,
              ),
            ),
            ),
          Expanded(
            child: SizedBox(
              height: 10,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8
            ),
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.lightGreen,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Cart',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.volunteer_activism,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Wishlist',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

Widget buildItem(ItemModel item) => Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(16),
    ),
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(item.pic),
          //fit: BoxFit.cover,
          width: 130,
          height: 130,
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
  );

