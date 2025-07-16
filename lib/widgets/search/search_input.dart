import 'package:dolap_app_clone/utils/models/search_actions_model.dart';
import 'package:dolap_app_clone/utils/services/api_service.dart';
import 'package:dolap_app_clone/widgets/search/search_actions.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final bool? isBack;
  final SearchActionsModel? isActions;
  final bool? isReadOnly;
  final Function? onSearch;
  const SearchInput({
    super.key,
    this.isBack,
    this.isActions,
    this.isReadOnly,
    this.onSearch,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // veya ihtiyaca göre
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          (widget.isBack ?? false)
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                )
              : SizedBox(),
          SizedBox(width: 10),
          Expanded(
            flex: 8,
            child: TextField(
              readOnly: widget.isReadOnly ?? true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade200.withValues(alpha: 0.5),
                hintText: "Ürün, kategori, marka ve @satıcı ara",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200.withValues(alpha: 0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade200.withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                labelStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search, color: Color(0xff08E1A1)),
              ),
              onTap: () {
                if (widget.isReadOnly == true) {
                  Navigator.pushNamed(context, "/search/search");
                }
              },
              onChanged: (value) async {
                setState(() {
                  widget.onSearch?.call(value);
                });
              },
            ),
          ),
          SearchActions(actions: widget.isActions),
        ],
      ),
    );
  }
}
