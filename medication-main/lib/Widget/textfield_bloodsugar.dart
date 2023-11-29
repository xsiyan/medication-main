import 'package:flutter/material.dart';

class TextFieldBloodSugar extends StatefulWidget {
  const TextFieldBloodSugar({
    Key? key,
    required this.maxLines,
    required this.hintText,
    required this.txtController,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final TextEditingController txtController;

  @override
  _TextFieldBloodSugarState createState() => _TextFieldBloodSugarState();
}

class _TextFieldBloodSugarState extends State<TextFieldBloodSugar> {
  var _textController;
  @override
  void initState() {
    super.initState();
    _textController;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void updateTextValue() {
    // No need to call setState here
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hintText,
        ),
        maxLines: widget.maxLines,
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class TextFieldMedicine extends StatelessWidget {
//   const TextFieldMedicine({
//     super.key,
//     required this.maxLines,
//     required this.hintText,
//     required this.txtController,
//   });

//   final String hintText;
//   final int maxLines;
//   final TextEditingController txtController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: TextField(
//           controller: txtController,
//           decoration: InputDecoration(
//               enabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               hintText: hintText),
//           maxLines: maxLines,
//         ));
//   }
// }
