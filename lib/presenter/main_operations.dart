import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../view/widgets/dialog.dart';

abstract class Operations {
  List<int> getNotCuteList();
  void addNewNotCuteEnough();
  void clearNotCutes();
  void removeNotCuteByElement(e);
  void showSnackbar(
      BuildContext context, String message, Function onPressRegret);
  void onPressShowUnlikeds(BuildContext context);
  isNextIndexnotCuteEnoughd(int val, int? max);
  isPreviusIndexnotCuteEnoughd(int val, int? min);
  Future onPressUpload();
}

class MainOperations implements Operations {
  MainOperations(int index, List<int> notCuteEnoughList, List<File> images)
      : _images = images,
        _index = index,
        _notCuteEnoughList = notCuteEnoughList;

  int _index = 0;
  final List<int> _notCuteEnoughList;
  final List<File> _images;

  get imagesLength {
    return _images.length;
  }

  List<File> get images {
    return _images;
  }

  get notCuteEnoughLength {
    return _notCuteEnoughList.length;
  }

  get notCuteEnoughList {
    return _notCuteEnoughList;
  }

  get index {
    return _index;
  }

  @override
  List<int> getNotCuteList() {
    return _notCuteEnoughList;
  }

  @override
  void addNewNotCuteEnough() {
    if (!_notCuteEnoughList.contains(_index)) {
      _notCuteEnoughList.add(_index);
      // _notCuteEnoughList = _notCuteEnoughList.toSet().toList();
    }
  }

  @override
  void clearNotCutes() {
    _notCuteEnoughList.clear();
  }

  @override
  void removeNotCuteByElement(e) {
    _notCuteEnoughList.removeWhere((element) => element == e);
  }

  @override
  void showSnackbar(
      BuildContext context, String message, Function onPressRegret) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(message),
        TextButton(
            child: const Text(
              "regret",
              style: TextStyle(color: Colors.amber),
            ),
            onPressed: () {
              print("aaa");
              onPressRegret();
            })
      ],
    )));
  }

  @override
  void onPressShowUnlikeds(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return InfoDialouge(
              blocedItems: _notCuteEnoughList,
              onDelete: (e) {
                // setState(() {
                _notCuteEnoughList.removeWhere((element) => element == e);
                // });
              });
        });
  }

  @override
  isNextIndexnotCuteEnoughd(int val, int? max) {
    if (_notCuteEnoughList.contains(val + 1)) {
      isNextIndexnotCuteEnoughd(val + 1, max);
    } else {
      if (max != null) {
        if (val < max - 1) {
          _index = val + 1;
        }
      } else {
        _index = val + 1;
      }
    }
  }

  @override
  isPreviusIndexnotCuteEnoughd(int val, int? min) {
    if (_notCuteEnoughList.contains(val - 1)) {
      isPreviusIndexnotCuteEnoughd(
        val - 1,
        min,
      );
    } else {
      if (min != null) {
        if (val >= min + 1) {
          _index = val - 1;
        }
      } else {
        _index = val - 1;
      }
    }
  }

  @override
  Future onPressUpload() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTempt = File(image.path);
      _images.add(imageTempt);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
