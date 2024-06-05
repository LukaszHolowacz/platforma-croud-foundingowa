import 'package:flutter/material.dart';
import 'package:mobile_application/pages/login_page.dart';
import 'package:mobile_application/pages/new_project_form/start_project_page.dart';
import '../components/home_components/project_card.dart';
import 'project_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> _items = List.generate(10, (index) => index);
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _items.addAll(List.generate(10, (index) => _items.length + index));
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Logo',
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartProjectPage()),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.black,
                side: const BorderSide(color: Colors.grey),
              ),
              child: const Text('Zgłoś Projekt'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text(
                'Zaloguj się',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _items.length + 1,
              itemBuilder: (context, index) {
                if (index == _items.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator()
                          : const SizedBox.shrink(),
                    ),
                  );
                }

                return ProjectCard(
                  title: 'Skrótowa nazwa projektu',
                  category: 'Kategoria projektu',
                  progress: 0.2,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectPage(
                          projectNumber: index + 1,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
