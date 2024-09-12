import 'package:flutter/material.dart';

import 'screen/add_post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(75, 87, 98, 38),
          primary: const Color.fromRGBO(75, 87, 98, 38),
          secondary: const Color.fromRGBO(229, 218, 208, 10),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Coffee App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPostScreen()),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0 ? const PostListScreen() : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '投稿',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // 投稿の数に合わせて変更
      itemBuilder: (context, index) {
        return const PostItem();
      },
    );
  }
}

class PostItem extends StatefulWidget {
  const PostItem({super.key});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/demi-deherrera-L-sm1B4L1Ns-unsplash.jpg"),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
                  onPressed: _toggleLike,
                ),
                GestureDetector(
                  onTap: () {
                    // コメント画面へ遷移
                  },
                  child: const Icon(Icons.comment),
                ),
              ],
            ),
            const Row(
              children: [
                CircleAvatar(
                  child: Text("KK"),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'コロンビア',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('原産国: コロンビア'),
                Text('Taste: 赤ワイン'),
                Text('Aroma: ラズベリー'),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text('感想: 浅煎りですが、奥行きが深く香りが抜群なスペシャルティ珈琲です。'),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('2023-07-27 12:00'),
            ),
          ],
        ),
      ),
    );
  }
}
