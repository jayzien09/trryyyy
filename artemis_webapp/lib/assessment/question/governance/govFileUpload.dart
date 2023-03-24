import 'dart:io';

import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_cropper/controller/crop_controller.dart';
import 'package:flutter_image_cropper/flutter_image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class FileUpload extends StatefulWidget {
  const FileUpload({super.key});

  @override
  State<FileUpload> createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  Uint8List? pickedFile;
  String? fileName;
  bool picked = false;
  Image? croppedImage;
  Uint8List? _pickedImage;
  String? name;
  String? _path;
  CroppedFile? _croppedImage;
  String? _croppath;
  Uint8List? imageToUpload;

  void pickFile() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      var a = await image.name;
      var s = await image.path;
      setState(() {
        _pickedImage = f;
        name = a;
        _path = s;
        _cropImage();
      });
    }
  }

  Future<void> _cropImage() async {
    if (_pickedImage != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _path!,
        compressQuality: 100,
        uiSettings: [
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort: const CroppieViewPort(
                width: 480, height: 480, type: 'rectangle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
            enableResize: true,
          ),
        ],
      );
      setState(() {
        _croppedImage = croppedFile;
        _croppath = _croppedImage!.path;
      });
      imageToUpload = await _croppedImage!.readAsBytes();
      _uploadFile();
    }
  }

  _uploadFile() async {
    UploadTask task = FirebaseStorage.instance
        .ref()
        .child("Governance/$name")
        .putData(imageToUpload!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //     'Upload your company’s latest Sustainability Report or equivalent document',
        //     style: TextStyle(
        //         fontSize: 30,
        //         color: AppColors.black,
        //         fontWeight: FontWeight.bold)),
        // SizedBox(
        //   height: 40,
        // ),
        if (_croppedImage != null)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.33,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.greyAccent,
              border: Border.all(color: AppColors.greyAccentLine),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      child: Image.network(_croppath!),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickFile();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Upload new file',
                            style:
                                TextStyle(color: AppColors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        //Upload files to Firebase Storage
        if (_croppedImage == null)
          GestureDetector(
            onTap: () async {
              pickFile();
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.greyAccent,
                  border: Border.all(color: AppColors.greyAccentLine),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageToUpload != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(imageToUpload!),
                            backgroundColor: AppColors.greyAccent,
                          )
                        : const CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://i.stack.imgur.com/l60Hf.png'),
                            backgroundColor: AppColors.greyAccent,
                          ),
                    // if (_croppedImage != null)
                    //   SizedBox(
                    //     height: 200,
                    //     width: 200,
                    //     child: Image.network(_croppath!),
                    //   ),
                    Icon(
                      Icons.file_copy_rounded,
                      size: 30,
                      color: AppColors.blueAccent,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Drag and drop your file here or ',
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 15,
                            )),
                        Text('click to upload',
                            style: const TextStyle(
                              color: AppColors.blueAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  // Widget _buildImage() {
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
  //         image: MemoryImage(_pickedImage!),
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildEmptyImage() {
  //   return Container(
  //     width: 200,
  //     height: 200,
  //     decoration: BoxDecoration(
  //       color: Colors.amber,
  //     ),
  //   );
  // }
}
