// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTP extends StatefulWidget {
  final List<TextEditingController> controller;
  const OTP({super.key, required this.controller});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  List<FocusNode> _node = <FocusNode>[];
  @override
  void initState() {
    super.initState();

    if (mounted) {
      _addControllers();
      _addNodes();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _disposeController();
  }

  void _disposeController() {
    widget.controller.map((e) => e.dispose());
  }

  void _addControllers() {
    for (var i = 0; i < 6; i++) {
      widget.controller.add(TextEditingController());
      // setState(() {});
    }
  }

  void _addNodes() {
    for (var i = 0; i < 6; i++) {
      _node.add(FocusNode());
      // setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildField();
  }

  Widget _buildField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.controller.length, (i) {
        return Container(
          width: 50.0,
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: TextField(
            controller: widget.controller[i],
            focusNode: _node[i],
            canRequestFocus: _node[i].canRequestFocus,
            keyboardType: TextInputType.number,
            onChanged: (myValue) {
              if (myValue.isEmpty && i > 0) {
                _node[i].previousFocus();
              } else if (myValue.isNotEmpty &&
                  widget.controller[i].text.length == 1) {
                _node[i].nextFocus();
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              LengthLimitingTextInputFormatter(1),
            ],
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5.0, left: 18.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        );
      }),
    );
  }
}
