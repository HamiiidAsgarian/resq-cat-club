import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'dialog.dart';

class PrivateGallary extends StatefulWidget {
  const PrivateGallary({super.key});

  @override
  State<PrivateGallary> createState() => _PrivateGallaryState();
}

class _PrivateGallaryState extends State<PrivateGallary>
    with AutomaticKeepAliveClientMixin<PrivateGallary> {
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return InfoDialouge(
                                    blocedItems: notCuteEnoughList,
                                    onDelete: (e) {
                                      setState(() {
                                        notCuteEnoughList.removeWhere(
                                            (element) => element == e);
                                      });
                                    });
                              });
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
                        setState(() {
                          notCuteEnoughList.clear();
                        });
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
                color: Colors.red,
                image: () {
                  return images.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.fill, image: FileImage(images[index]))
                      : null;
                }()),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(Icons.heart_broken_rounded),
                  onPressed: () {
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
                                  notCuteEnoughList
                                      .removeWhere((e) => e == index);
                                });
                              })
                        ],
                      )));
                    }
                  }),
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.upload_file_outlined),
                  onPressed: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final imageTempt = File(image.path);
                      setState(() {
                        images.add(imageTempt);
                      });
                    } on PlatformException catch (e) {
                      print(e);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }

  isNextIndexnotCuteEnoughd(int val) {
    if (val < images.length - 1) {
      if (notCuteEnoughList.contains(val + 1)) {
        isNextIndexnotCuteEnoughd(val + 1);
      } else {
        setState(() {
          index = val + 1;
        });
      }
    }
  }

  isPreviusIndexnotCuteEnoughd(int val) {
    if (val > 0) {
      if (notCuteEnoughList.contains(val - 1)) {
        isPreviusIndexnotCuteEnoughd(val - 1);
      } else {
        setState(() {
          index = val - 1;
        });
      }
    }
  }

  @override
  bool get wantKeepAlive => true;
}
