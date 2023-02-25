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
          backgroundColor: const Color.fromARGB(255, 245, 255, 244),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 190, 98),
                    border: Border.all(
                        width: 4, color: const Color.fromARGB(255, 0, 0, 0)),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    )),
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "= ",
                        style: TextStyle(
                            fontFamily: "symbol",
                            fontSize: 40,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          "ResQ Cat Club",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: "pawn",
                          ),
                        ),
                      ),
                      Text(
                        " y",
                        style: TextStyle(
                            fontFamily: "symbol",
                            fontSize: 40,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  // color: Colors.blue,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Tab(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 20,
                                        fontFamily: "text",
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
                const Expanded(
                    child: TabBarView(
                        children: [PublicGallary(), PrivateGallary()]))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
