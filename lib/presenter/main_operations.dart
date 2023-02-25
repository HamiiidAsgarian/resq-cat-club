import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resq_cat_club/core/const.dart';

import '../view/widgets/dialog.dart';

abstract class Operations {
  List<int> getNotCuteList();
  void addNewNotCuteEnough();
  void clearNotCutes();
  void removeNotCuteByElement(dynamic e);
  void showSnackbar(
      BuildContext context, String message, Function onPressRegret);
  void onPressShowUnlikeds(BuildContext context);
  void isNextIndexnotCuteEnoughd(int val, int? max);
  void isPreviusIndexnotCuteEnoughd(int val, int? min);
  Future<void> onPressUpload();
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
    }
  }

  @override
  void clearNotCutes() {
    _notCuteEnoughList.clear();
  }

  @override
  void removeNotCuteByElement(dynamic e) {
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
        Row(
          children: [
            TextButton(
                child: const Text(
                  "regret",
                  style: TextStyle(color: Colors.amber, fontFamily: 'arial'),
                ),
                onPressed: () {
                  onPressRegret();
                }),
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                icon: const Icon(Icons.close, color: AppConsts.mainWhite))
          ],
        )
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
                _notCuteEnoughList.removeWhere((element) => element == e);
              });
        });
  }

  @override

  /// a recursive function to find the immidiate available [index] inwhich is not blocked as a [notCuteEnough].
  /// [max] is required for the [privateGallary] because it does not have  infinite positive
  ///  index and is limited to the uploaded images length only
  void isNextIndexnotCuteEnoughd(int val, int? max) {
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

  /// a recursive function to find the immidiate available [index] inwhich is not blocked as a [notCuteEnough].
  /// [min] is required for the [privateGallary] because it does not have infinite negative
  ///  index and is limited to the uploaded images length only

  @override
  void isPreviusIndexnotCuteEnoughd(int val, int? min) {
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

  /// let the user to pic an image from device gallary and adds to the [images] list.

  @override
  Future<void> onPressUpload() async {
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
