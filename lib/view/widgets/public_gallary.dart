import 'package:flutter/material.dart';
import 'package:resq_cat_club/presenter/main_operations.dart';
import 'dialog.dart';

class PublicGallary extends StatefulWidget {
  const PublicGallary({super.key});

  @override
  State<PublicGallary> createState() => _PublicGallaryState();
}

class _PublicGallaryState extends State<PublicGallary>
    with AutomaticKeepAliveClientMixin<PublicGallary> {
  MainOperations publicGallaryCats = MainOperations(0, [], []);

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
                                      "${publicGallaryCats.notCuteEnoughLength}",
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
                child: Text("Cat Number ${publicGallaryCats.index}"),
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
                        'https://placekitten.com/300/500?image=${publicGallaryCats.index}'))),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          isPreviusIndexnotCuteEnoughd(publicGallaryCats.index);
                          // }
                        }),
                    IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                        onPressed: () {
                          isNextIndexnotCuteEnoughd(publicGallaryCats.index);
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
      publicGallaryCats.clearNotCutes();
    });
  }

  void onPressNotcuteEnogh(BuildContext context) {
    setState(() {
      publicGallaryCats.addNewNotCuteEnough();
      publicGallaryCats.showSnackbar(context,
          "${publicGallaryCats.index} is added to the notCuteEnough list", () {
        setState(() {
          publicGallaryCats.removeNotCuteByElement(publicGallaryCats.index);
        });
      });
    });
  }

  void onPressShowUnlikeds(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return InfoDialouge(
              blocedItems: publicGallaryCats.getNotCuteList(),
              onDelete: (e) {
                setState(() {
                  publicGallaryCats.removeNotCuteByElement(e);
                });
              });
        });
  }

  isNextIndexnotCuteEnoughd(int val) {
    setState(() {
      publicGallaryCats.isNextIndexnotCuteEnoughd(val, null);
    });
  }

  isPreviusIndexnotCuteEnoughd(int val) {
    setState(() {
      publicGallaryCats.isPreviusIndexnotCuteEnoughd(val, null);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
