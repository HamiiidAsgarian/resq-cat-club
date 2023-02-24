import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../view/widgets/dialog.dart';

class MainOperations {
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

  List<int> getNotCuteList() {
    return _notCuteEnoughList;
  }

  void addNewNotCuteEnough() {
    if (!_notCuteEnoughList.contains(_index)) {
      _notCuteEnoughList.add(_index);
      // _notCuteEnoughList = _notCuteEnoughList.toSet().toList();
    }
  }

  void clearNotCutes() {
    _notCuteEnoughList.clear();
  }

  void removeNotCuteByElement(e) {
    _notCuteEnoughList.removeWhere((element) => element == e);
  }

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
              onPressRegret();
            })
      ],
    )));
  }

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
