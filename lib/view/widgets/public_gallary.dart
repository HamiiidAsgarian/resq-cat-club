import 'dart:io';

import 'package:flutter/material.dart';

import 'dialog.dart';

class PublicGallary extends StatefulWidget {
  const PublicGallary({super.key});

  @override
  State<PublicGallary> createState() => _PublicGallaryState();
}

class _PublicGallaryState extends State<PublicGallary>
    with AutomaticKeepAliveClientMixin<PublicGallary> {
  int index = 0;
  List<int> notCuteEnoughList = [];
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50,
            child: Stack(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Stack(children: [
                    FloatingActionButton(
                        backgroundColor: Colors.amber,
                        elevation: 0,
                        onPressed: () {
                          onPressShowUnlikeds(context);
                        },
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "${notCuteEnoughList.length}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  )),
                            ),
                            const Center(
                              child: Icon(
                                Icons.heart_broken_outlined,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Cat Number $index"),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      elevation: 0,
                      onPressed: () {
                        onPressClearList();
                      },
                      child: const Icon(Icons.handshake_outlined)))
            ]),
          ),
          Center(
              child: Container(
            width: 300,
            height: 500,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: const Color.fromARGB(255, 0, 0, 0)),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://placekitten.com/300/500?image=$index'))),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          isPreviusIndexnotCuteEnoughd(index);
                          // }
                        }),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                        onPressed: () {
                          isNextIndexnotCuteEnoughd(index);
                        })
                  ]),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(Icons.heart_broken_rounded),
                  onPressed: () {
                    onPressNotcuteEnogh(context);
                  }),
            ],
          ),
        ],
      ),
    );
  }

  void onPressClearList() {
    setState(() {
      notCuteEnoughList.clear();
    });
  }

  void onPressNotcuteEnogh(BuildContext context) {
    if (!notCuteEnoughList.contains(index)) {
      setState(() {
        notCuteEnoughList.add(index);
        notCuteEnoughList = notCuteEnoughList.toSet().toList();
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$index is added to the notCuteEnough list"),
          TextButton(
              child: const Text(
                "regret",
                style: TextStyle(color: Colors.amber),
              ),
              onPressed: () {
                setState(() {
                  notCuteEnoughList.removeWhere((e) => e == index);
                });
              })
        ],
      )));
    }
  }

  void onPressShowUnlikeds(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return InfoDialouge(
              blocedItems: notCuteEnoughList,
              onDelete: (e) {
                setState(() {
                  notCuteEnoughList.removeWhere((element) => element == e);
                });
              });
        });
  }

  isNextIndexnotCuteEnoughd(int val) {
    if (notCuteEnoughList.contains(val + 1)) {
      isNextIndexnotCuteEnoughd(val + 1);
    } else {
      setState(() {
        index = val + 1;
      });
    }
  }

  isPreviusIndexnotCuteEnoughd(int val) {
    if (notCuteEnoughList.contains(val - 1)) {
      isPreviusIndexnotCuteEnoughd(val - 1);
    } else {
      setState(() {
        index = val - 1;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
