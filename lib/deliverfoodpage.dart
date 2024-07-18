import 'package:flutter/material.dart';

class DeliverFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('送餐服务'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 搜索框
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '搜索餐厅或菜品',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // 推荐餐厅
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '推荐餐厅',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  return _buildRestaurantCard(restaurantList[index]);
                },
              ),
            ),
            // 菜品分类
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Text(
                '菜品分类',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: foodCategories.map((category) {
                return _buildFoodCategoryCard(category);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Card(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              restaurant.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              restaurant.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodCategoryCard(FoodCategory category) {
    return GestureDetector(
      onTap: () {
        // 这里可以添加点击事件，例如导航到该类别的菜品列表页面
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(category.imageUrl),
          ),
          SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class Restaurant {
  final String imageUrl;
  final String name;

  Restaurant({required this.imageUrl, required this.name});
}

class FoodCategory {
  final String imageUrl;
  final String name;

  FoodCategory({required this.imageUrl, required this.name});
}

// 示例数据
final List<Restaurant> restaurantList = [
  Restaurant(imageUrl: 'assets/store1.png', name: '老王烧烤'),
  Restaurant(imageUrl: 'assets/store2.png', name: '小李火锅'),
  Restaurant(imageUrl: 'assets/store1.png', name: '张三快餐'),
  Restaurant(imageUrl: 'assets/store2.png', name: '肥猫快餐'),
];

final List<FoodCategory> foodCategories = [
  FoodCategory(imageUrl: 'assets/food1.png', name: '快餐'),
  FoodCategory(imageUrl: 'assets/food2.png', name: '烧烤'),
  FoodCategory(imageUrl: 'assets/food3.png', name: '火锅'),
  FoodCategory(imageUrl: 'assets/food4.png', name: '甜品'),

];
