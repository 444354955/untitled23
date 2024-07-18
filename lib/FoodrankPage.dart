import 'package:flutter/material.dart';

void main() {
  runApp(FoodrankPage());
}

class FoodrankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '营养排行榜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NutritionPage(),
    );
  }
}

class NutritionPage extends StatefulWidget {
  @override
  _NutritionPageState createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  final List<String> _nutrients = [
    '蛋白质',
    '脂肪',
    '碳水化合物',
    '膳食纤维',
    '维生素A',
    '胡萝卜素',
    '维生素B1',
    '维生素B2',
    '维生素C',
    '维生素E',
    '烟酸',
  ];

  final Map<String, List<Map<String, String>>> _foodRanking = {
    '蛋白质': [
      {'name': '鸡胸肉', 'value': '32.1g'},
      {'name': '牛排', 'value': '31.1g'},
      {'name': '三文鱼', 'value': '25.4g'},
      {'name': '金枪鱼', 'value': '29.9g'},
      {'name': '豆腐', 'value': '17.3g'},
      {'name': '扁豆', 'value': '9g'},
      {'name': '鸡蛋', 'value': '12.6g'},
      {'name': '乳清蛋白粉', 'value': '79g'},
      {'name': '奶酪', 'value': '25g'},
      {'name': '希腊酸奶', 'value': '10g'},
    ],
    '脂肪': [
      {'name': '肥牛肉', 'value': '45.1g'},
      {'name': '猪肋排', 'value': '39.2g'},
      {'name': '羊肋排', 'value': '35.6g'},
      {'name': '奶油', 'value': '81.1g'},
      {'name': '坚果', 'value': '49.9g'},
      {'name': '巧克力', 'value': '32.4g'},
      {'name': '芝士', 'value': '33.3g'},
      {'name': '火腿', 'value': '30.9g'},
      {'name': '香肠', 'value': '27.4g'},
      {'name': '黄油', 'value': '81.0g'},
    ],
    '碳水化合物': [
      {'name': '白米', 'value': '77.6g'},
      {'name': '面条', 'value': '74.1g'},
      {'name': '土豆', 'value': '17.6g'},
      {'name': '红薯', 'value': '20.1g'},
      {'name': '燕麦片', 'value': '66.3g'},
      {'name': '面包', 'value': '49.4g'},
      {'name': '玉米', 'value': '74.3g'},
      {'name': '小米', 'value': '72.9g'},
      {'name': '麦片', 'value': '66.6g'},
      {'name': '冬瓜', 'value': '4.3g'},
    ],
    '维生素C': [
      {'name': '冬枣', 'value': '243mg'},
      {'name': '沙棘', 'value': '204mg'},
      {'name': '青枣', 'value': '200mg'},
      {'name': '彩椒', 'value': '104mg'},
      {'name': '苋菜', 'value': '76mg'},
      {'name': '大辣椒', 'value': '72mg'},
      {'name': '百香果', 'value': '70mg'},
      {'name': '番石榴', 'value': '68mg'},
    ],
  };

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('营养排行榜'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: _nutrients
                .map((nutrient) => NavigationRailDestination(
              icon: Icon(Icons.local_dining),
              selectedIcon: Icon(Icons.local_dining),
              label: Text(nutrient),
            ))
                .toList(),
          ),
          Expanded(
            child: _buildFoodRanking(_nutrients[_selectedIndex]),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodRanking(String nutrient) {
    final List<Map<String, String>> ranking = _foodRanking[nutrient] ?? [];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: ranking.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(ranking[index]['name']!),
            trailing: Text('${ranking[index]['value']}'),
          );
        },
      ),
    );
  }
}
