import 'package:flutter/material.dart';

class AddCircleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddCircleButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child:
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                  Text('Add',style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),)
                ],
              ),
        ),
      ),
    );
  }
}
