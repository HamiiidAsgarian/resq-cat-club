import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialouge extends StatefulWidget {
  const InfoDialouge(
      {Key? key, required this.onDelete, required this.blocedItems})
      : super(key: key);
  final Function onDelete;
  final List<int> blocedItems;

  @override
  State<InfoDialouge> createState() => _InfoDialougeState();
}

class _InfoDialougeState extends State<InfoDialouge> {
  late List<int> blocedItemsLocal;
  @override
  void initState() {
    blocedItemsLocal = widget.blocedItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      titlePadding: const EdgeInsets.only(left: 25),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Not Cute Enough List",
          ),
          CupertinoButton(
            child: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      children: [
        SizedBox(
          height: 200,
          width: 100,
          child: ListView.builder(
              itemCount: blocedItemsLocal.length,
              itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(blocedItemsLocal[index].toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                blocedItemsLocal.removeWhere((element) =>
                                    element == blocedItemsLocal[index]);
                              });
                              widget.onDelete(index);
                            },
                            icon: const Icon(Icons.delete))
                      ])),
        )
      ],
    );
  }
}
