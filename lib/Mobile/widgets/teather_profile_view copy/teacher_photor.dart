import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:quizapp/utils/constants.dart';
import 'dart:io';

class TeacherPhoto extends StatefulWidget {
  const TeacherPhoto({
    super.key,
    required this.image,
    this.selectedImage,
    required this.onPressed,
  });

  final String image;
  final File? selectedImage;
  final VoidCallback onPressed;

  @override
  State<TeacherPhoto> createState() => _TeacherPhotoState();
}

class _TeacherPhotoState extends State<TeacherPhoto> {
  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = widget.selectedImage != null
        ? FileImage(widget.selectedImage!)
        : NetworkImage(widget.image) as ImageProvider;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(3, 3),
          ),
        ],
        shape: BoxShape.circle,
        border: Border.all(
          color: kOrange,
          width: 0.5,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.sizeOf(context).height * .07,
            backgroundImage: imageProvider,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Bounceable(
              onTap: widget.onPressed,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kOrange,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5.0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add_a_photo,
                  color: kBlack,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
