import 'package:flutter/material.dart';

class TabsList extends StatefulWidget {
  const TabsList({super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList>
    with SingleTickerProviderStateMixin {
  List<String> tabs = ['News', 'Video', 'Artists', 'Albums', 'Podcasts'];

  late TabController tabController;
  bool isClicked = true;

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabs: List.generate(
        tabs.length,
        (index) => Text(
          tabs[index],
        ),
      ),
    );
  }
}
