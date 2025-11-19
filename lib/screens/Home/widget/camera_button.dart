import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraButton extends StatelessWidget {
  final Function(String imagePath) onImageCaptured;
  final String buttonText;


  const CameraButton({super.key, required this.onImageCaptured, required this.buttonText});

  Future<void> _takePhoto(BuildContext context) async{
    try {
      // request camera permission
      final Status = await Permission.camera.request();

      if (Status.isDenied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Camera permission is required to take photos'),
              backgroundColor: Colors.orange,
            )
          );
        }
        return;
      }
      if (Status.isPermanentlyDenied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context). showSnackBar(
            SnackBar(
              content: Text('Camera permission denied. Please enable in settings'),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Settings',
                onPressed: () => openAppSettings(),
              ),
             )
          );
        };
        return;
      }

      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
          // ini buat kamre belakang 
        imageQuality: 70, //conpressed image
      );

      if (photo != null) {
        onImageCaptured(photo.path);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error taking photo: ${e.toString()}'),
            backgroundColor: Colors.red,
          )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _takePhoto(context),
      icon: Icon(Icons.camera_alt),
      label: Text(buttonText),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      )
    );
  }
}