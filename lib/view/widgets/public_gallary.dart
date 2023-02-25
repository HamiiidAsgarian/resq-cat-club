import 'package:flutter/material.dart';
import 'package:resq_cat_club/presenter/main_operations.dart';
import '../../core/const.dart';
import 'dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PublicGallary extends StatefulWidget {
  const PublicGallary({super.key});

  @override
  State<PublicGallary> createState() => _PublicGallaryState();
}

class _PublicGallaryState extends State<PublicGallary>
    with AutomaticKeepAliveClientMixin<PublicGallary> {
  late MainOperations publicGallaryCats;
  @override
  void initState() {
    publicGallaryCats = MainOperations(0, [], []);
    super.initState();
  }

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
                        onPressed: () => onPressShowUnlikeds(context),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                      color: AppConsts.mainWhite,
                                      shape: BoxShape.circle),
                                  child: Center(
                                    child: Text(
                                      "${publicGallaryCats.notCuteEnoughLength}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "text"),
                                    ),
                                  )),
                            ),
                            const Center(
                              child: Text(
                                "X",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "symbol",
                                    color: AppConsts.mainWhite),
                              ),
                            )
                          ],
                        )),
                  ]),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                      backgroundColor: Colors.amber,
                      elevation: 0,
                      onPressed: () => onPressClearList(),

                      /// > represents cat symbol in [symbol] font

                      child: const Text(
                        ">",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "symbol",
                            color: AppConsts.mainWhite),
                      ))),
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
                color: AppConsts.mainWhite,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        'https://placekitten.com/300/500?image=${publicGallaryCats.index}'))),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      clipBehavior: Clip.none,
                      width: double.infinity,
                      height: 75,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black,
                            Color.fromARGB(0, 255, 255, 255)
                          ])),
                      child: Center(
                        child: Text(
                          "Cat Number ${publicGallaryCats.index}",
                          style: const TextStyle(
                            color: AppConsts.mainWhite,
                            fontSize: 30,
                            fontFamily: "text",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: AppConsts.mainWhite),
                            onPressed: () => isPreviusIndexnotCuteEnoughd(
                                publicGallaryCats.index)
                            // }
                            ),
                        IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: AppConsts.mainWhite),
                            onPressed: () => isNextIndexnotCuteEnoughd(
                                publicGallaryCats.index))
                      ]),
                ),
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.redAccent,

                  /// x represents cat symbol in [symbol] font

                  child: const Text(
                    "X",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "symbol",
                        color: AppConsts.mainWhite),
                  ),
                  onPressed: () => onPressNotcuteEnogh(context)),
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

  void isNextIndexnotCuteEnoughd(int val) {
    setState(() {
      publicGallaryCats.isNextIndexnotCuteEnoughd(val, null);
    });
  }

  void isPreviusIndexnotCuteEnoughd(int val) {
    setState(() {
      publicGallaryCats.isPreviusIndexnotCuteEnoughd(val, null);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
