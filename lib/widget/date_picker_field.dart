
import 'package:flutter/material.dart';
import '../constant/color.dart';


class DatePickerField extends StatelessWidget {
  final String? level;
  final VoidCallback ? onTap;
  final String? hintText;

  const DatePickerField({
    Key? key, 
    this.level, 
    this.onTap, 
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$level",
           style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(height: 10,),
        InkWell(
          onTap: onTap,
          child: IgnorePointer(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: textColor),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(width: 2.0, color: primaryColor),
                ),
                suffixIcon: Icon(Icons.calendar_today, color: textColor,)
              ),
            ),
          ),
        ),
      ],
    );
  }
} 

