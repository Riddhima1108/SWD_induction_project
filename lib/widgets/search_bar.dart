import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController? _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Active = TextStyle(color: Colors.black);
    final Hint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? Hint : Active;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29.5),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    _textEditingController!.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: "Search",
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
