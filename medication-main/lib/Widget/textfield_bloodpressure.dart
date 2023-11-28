import 'package:flutter/material.dart';

class TextFieldBloodPressure extends StatefulWidget {
  const TextFieldBloodPressure({
    Key? key,
    required this.maxLines,
    required this.hintText,
    required this.txtController,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final TextEditingController txtController;

  @override
  _TextFieldBloodPressureState createState() => _TextFieldBloodPressureState();
}

class _TextFieldBloodPressureState extends State<TextFieldBloodPressure> {
  var _textController;

  @override
  void initState() {
    super.initState();
    _textController = widget.txtController;
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

// class TextFieldBloodPressure extends StatefulWidget {
//   const TextFieldBloodPressure({
//     Key? key,
//     required this.maxLines,
//     required this.hintText,
//     required this.txtController,
//   }) : super(key: key);

//   final String hintText;
//   final int maxLines;
//   final TextEditingController txtController;

//   @override
//   _TextFieldBloodPressureState createState() => _TextFieldBloodPressureState();
// }

// class _TextFieldBloodPressureState extends State<TextFieldBloodPressure> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextField(
//         controller: widget.txtController,
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           hintText: widget.hintText,
//         ),
//         maxLines: widget.maxLines,
//       ),
//     );
//   }
// }

// class TextFieldBloodPressure extends StatelessWidget {
//   final TextEditingController txtController;
//   final String hintText;
//   final int maxLines;

//   const TextFieldBloodPressure({
//     Key? key,
//     required this.txtController,
//     required this.hintText,
//     this.maxLines = 1,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: txtController, // Pass the text controller here
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
