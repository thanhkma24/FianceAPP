import 'package:flutter/cupertino.dart';
import 'package:common/utils/color.dart';
import 'package:flutter/material.dart';

class InputLogin extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final bool fieldPassword;
  final double maxWidth;

  const InputLogin({
    Key? key,
    this.controller,
    this.labelText = '',
    this.hintText,
    this.prefixIcon,
    this.fieldPassword = false,
    this.maxWidth = 350,
  }) : super(key: key);

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> {
  bool _clear = false;
  bool _obscureText = false;
  double _sizeIcon = 18.0;
  final _focusNode = FocusNode();

  notifyChange() => setState(() {});

  _listener() {
    if (_focusNode.hasFocus) {
      _clear = widget.controller?.text.isEmpty == false;
    } else
      _clear = false;
    notifyChange();
  }

  @override
  void initState() {
    _obscureText = widget.fieldPassword;
    _focusNode.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_listener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxWidth: widget.maxWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText.isNotEmpty)
            Column(
              children: <Widget>[
                Text(
                  widget.labelText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.hexToColor('#707070').withOpacity(.7),
                  ),
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: _obscureText,
            style: TextStyle(fontSize: 15),
            cursorColor: _theme.primaryColor,
            decoration: InputDecoration(
              // labelText: widget.labelText,
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              labelStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
              ),
              hintStyle: TextStyle(
                color: _theme.hintColor,
                fontSize: 15,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: _theme.primaryColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: _theme.primaryColor,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              suffixIcon: widget.fieldPassword
                  ? InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        notifyChange();
                      },
                      child: Icon(
                        _obscureText == true
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash,
                        size: _sizeIcon,
                        color: _theme.primaryColor,
                      ),
                    )
                  : _clear
                      ? InkWell(
                          onTap: () {
                            _clear = false;
                            notifyChange();
                            widget.controller?.clear();
                          },
                          child: Icon(
                            CupertinoIcons.clear_circled,
                            size: _sizeIcon,
                            color: _theme.primaryColor,
                          ),
                        )
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
