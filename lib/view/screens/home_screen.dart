import 'package:flutter/material.dart';
import 'package:resq_cat_club/view/widgets/private_gallary.dart';
import '../widgets/public_gallary.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [const PublicGallary(), const PrivateGallary()];

    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "ResQ Cat Club",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: TabBar(
                    physics: const BouncingScrollPhysics(),
                    isScrollable: true,
                    indicatorPadding: const EdgeInsets.all(5),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    tabs: ["Online", "Private"]
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Tab(text: e),
                            ))
                        .toList()),
              ),
            ),
            const Expanded(
                child:
                    TabBarView(children: [PublicGallary(), PrivateGallary()]))
          ]),
        ),
      ),
    );
  }
}
