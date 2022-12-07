import 'dart:io';

import 'package:clothes_app_starter/screens/New/Widget/text_field.dart';
import 'package:clothes_app_starter/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class NewItem extends ConsumerStatefulWidget {
  const NewItem({Key? key}) : super(key: key);

  @override
  ConsumerState<NewItem> createState() => _NewItemState();
}

class _NewItemState extends ConsumerState<NewItem> {
  get formKey => null;
  var thumbnailProvider = StateProvider<File?>((ref) => null);
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  File? thumbImage;
  List<XFile>? _imageFileList;

  void _setImageFileList(XFile? images) {
    _imageFileList = images == null ? null : <XFile>[images];
  }

  Future pickThumbnail() async {
    try {
      final thumbnail =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (thumbnail == null) return;
      final temporaryThumbnail = File(thumbnail.path);

      print("This is the path: ${temporaryThumbnail.path}");

      ref.read(thumbnailProvider.notifier).state =
          (this.thumbImage = temporaryThumbnail);
    } on PlatformException catch (e) {
      print("Failed to pick image file: ${e.message}");
    }
  }

  Future pickOtherImages() async {
    try {
      final thumbnail = await ImagePicker().pickMultiImage();
    } on PlatformException catch (e) {
      print("Failed to pick image file: ${e.message}");
    }
  }

  Future<File> saveImagePermantly(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    print("This is the file path: ${thumbImage?.path}");
    return Scaffold(
      appBar: PreferredSize(
          child: CommonAppBar(title: "Create an item"),
          preferredSize: Size(60, 60)),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomizedField(
                    hintText: "Enter item name",
                    labelText: "Item Name",
                    controller: nameController,
                    onChangeFunc: (s) {
                      print("This is the name: ${nameController.text}");
                    },
                  ),
                  SizedBox(height: 10),
                  CustomizedField(
                    hintText: "Enter descriptions",
                    labelText: "Description",
                    controller: nameController,
                    onChangeFunc: (s) {
                      print("This is the name: ${nameController.text}");
                    },
                  ),
                  SizedBox(height: 10),
                  CustomizedField(
                    hintText: "Enter price",
                    labelText: "Price",
                    controller: nameController,
                    onChangeFunc: (s) {
                      print("This is the name: ${nameController.text}");
                    },
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () => pickThumbnail(),
                    child: CustomizedField(
                      enable: false,
                      labelText: "Pick thumbnail",
                      suffixIcon: Icon(Icons.image),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: pickOtherImages,
                    child: CustomizedField(
                      enable: false,
                      labelText: "Pick other images",
                      suffixIcon: Icon(Icons.image),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: 300,
                    color:Colors.red,
                    child: thumbImage != null
                        ? Image.file(thumbImage!)
                        : Container(),
                  )
                ],
              ),
            )),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            child: ElevatedButton(
              onPressed: () => context.go("/home"),
              child: Text("Add"),
            ),
          )),
    );
  }
}
