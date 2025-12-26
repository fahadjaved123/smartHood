import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsWidget extends StatelessWidget {
  IconData? icon;
  String? image;
  String label;
  String? value;
  DetailsWidget(
      {super.key,
      this.icon,
      this.image,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image!,
                  width: 33,
                  height: 33,
                  fit: BoxFit.cover,
                  color: Colors.teal,
                ),
              )
            : Icon(
                icon ?? Icons.info,
                color: Colors.teal,
                size: 28,
              ),
        title: Text(label,
            style:
                const TextStyle(fontWeight: FontWeight.w600, fontSize: 12.5)),
        subtitle: Text(value ?? "N/A",
            style: const TextStyle(color: Colors.black87, fontSize: 13)),
      ),
    );
  }
}
