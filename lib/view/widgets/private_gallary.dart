import 'package:flutter/material.dart';
import 'package:resq_cat_club/presenter/main_operations.dart';

import '../../core/const.dart';
import 'dialog.dart';

class PrivateGallary extends StatefulWidget {
  const PrivateGallary({super.key});

  @override
  State<PrivateGallary> createState() => _PrivateGallaryState();
}

class _PrivateGallaryState extends State<PrivateGallary>
    with AutomaticKeepAliveClientMixin<PrivateGallary> {
  late MainOperations privateGallaryCats;
  @override
  void initState() {
    privateGallaryCats = MainOperations(0, [], []);
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
                                      "${privateGallaryCats.notCuteEnoughLength}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: "text"),
                                    ),
                                  )),
                            ),
                            const Center(
                              /// x represents cat symbol in [symbol] font
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

                /// if there is at least on uploaded image in [images] image would appear

                image: () {
                  if (privateGallaryCats.images.isNotEmpty) {
                    return privateGallaryCats.images.isNotEmpty
                        ? DecorationImage(
                            fit: BoxFit.fill,
                            image: FileImage(privateGallaryCats
                                .images[privateGallaryCats.index]))
                        : null;
                  }
                }()),
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
                          "Cat Number ${privateGallaryCats.index}",
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
                                privateGallaryCats.index)),
                        IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: AppConsts.mainWhite),
                            onPressed: () => isNextIndexnotCuteEnoughd(
                                privateGallaryCats.index))
                      ]),
                ),
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.redAccent,
                  child: const Text(
                    "X",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "symbol",
                        color: AppConsts.mainWhite),
                  ),
                  onPressed: () => onPressNotcuteEnogh(context)),
              FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.upload_file_outlined,
                      color: AppConsts.mainWhite),
                  onPressed: () => onPressUpload()),
            ],
          ),
        ],
      ),
    );
  }

  void onPressClearList() {
    setState(() {
      privateGallaryCats.clearNotCutes();
    });
  }

  void onPressNotcuteEnogh(BuildContext context) {
    if (privateGallaryCats.images.isNotEmpty) {
      privateGallaryCats.addNewNotCuteEnough();
      privateGallaryCats.showSnackbar(context,
          "${privateGallaryCats.index} is added to the notCuteEnough list", () {
        setState(() {
          privateGallaryCats.removeNotCuteByElement(privateGallaryCats.index);
        });
      });
    }

    setState(() {});
  }

  void onPressShowUnlikeds(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return InfoDialouge(
              blocedItems: privateGallaryCats.getNotCuteList(),
              onDelete: (e) {
                setState(() {
                  privateGallaryCats.removeNotCuteByElement(e);
                });
              });
        });
  }

  void isNextIndexnotCuteEnoughd(int val) {
    setState(() {
      privateGallaryCats.isNextIndexnotCuteEnoughd(
          val, privateGallaryCats.imagesLength);
    });
  }

  void isPreviusIndexnotCuteEnoughd(int val) {
    setState(() {
      privateGallaryCats.isPreviusIndexnotCuteEnoughd(val, 0);
    });
  }

  Future<void> onPressUpload() async {
    await privateGallaryCats.onPressUpload();

    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
