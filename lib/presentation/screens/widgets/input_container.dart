import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/helpers/styles_app.dart';

class InputContainer extends StatefulWidget {
  final bool obscureText;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool showHidePassword;
  final bool multiLine;
  final BoxBorder? border;
  final bool typeNumber;
  final bool search;
  final Function(String?)? onSearch;
  final Function(String)? onChanged;

  const InputContainer({
    Key? key,
    required this.label,
    this.hintText = "",
    this.obscureText = false,
    this.controller,
    this.showHidePassword = false,
    this.multiLine = false,
    this.border,
    this.typeNumber = false,
    this.search = false,
    this.onSearch,
    this.onChanged,
  }) : super(key: key);

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  late bool showPassword;

  @override
  void initState() {
    showPassword = widget.obscureText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // TitleSmall(text: widget.label),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: widget.multiLine ? 120 : null ,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusApp.widget,
            color: ColorsApp.secondary,
            border: widget.border
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: showPassword,
            cursorColor: ColorsApp.textColor,
            style: const TextStyle(color: ColorsApp.textColor),
            maxLines: widget.multiLine ? null : 1,
            // minLines: 1,
            onSubmitted: (val){
              if(widget.onSearch != null && val.isNotEmpty && val.length > 2) {
                widget.onSearch!(val);
              }
            },
            onChanged: widget.onChanged,
            keyboardType: widget.typeNumber ? TextInputType.number : widget.obscureText
                ? TextInputType.text
                : TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              suffixIcon: widget.showHidePassword || widget.search
                  ? GestureDetector(
                      onTap: widget.search ? (){
                        if(widget.onSearch != null) {
                          widget.onSearch!(null);
                        }
                      } : () => setState(
                        () => showPassword = !showPassword,
                      ),
                      child: widget.search ? const Icon(Icons.search, color: ColorsApp.textColor,)
                          : Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: ColorsApp.textColor,),
                    )
                  : const SizedBox(height: 24),
              isDense: true,
              isCollapsed: true,
              hintText: widget.hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(color: ColorsApp.textColor.withOpacity(0.7))
            ),
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: widget.typeNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
          ),
        ),
      ],
    );
  }
}
