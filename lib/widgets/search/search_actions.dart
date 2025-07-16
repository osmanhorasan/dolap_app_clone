import 'package:dolap_app_clone/ui/favorite_button.dart';
import 'package:dolap_app_clone/utils/models/search_actions_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SearchActions extends StatelessWidget {
  final SearchActionsModel? actions;
  const SearchActions({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SearchActionItem(
          icon: Icons.search,
          onPress: () {
            Navigator.pushNamed(context, "/search/search-categories");
          },
          isActive: actions?.isSearch ?? true,
        ),
        SearchActionItem(
          icon: Icons.settings_outlined,
          onPress: () {
            Navigator.pushNamed(context, "/search/search-categories");
          },
          isActive: actions?.isSetting ?? false,
        ),
        SearchActionItem(
          icon: Icons.notifications_outlined,
          onPress: () {
            Navigator.pushNamed(context, "/search/search-categories");
          },
          isActive: actions?.isNotification ?? true,
        ),
        SearchActionItem(
          icon: Icons.share,
          onPress: () async {
            await Share.share(
              'https://seninpaylasmakistediginlink.com',
              subject: 'Bağlantıyı Paylaş',
            );
          },
          isActive: actions?.isShare ?? false,
        ),

        /*SearchActionItem(
          icon: Icons.favorite_outline,
          onPress: () {
            Navigator.pushNamed(context, "/search/search-categories");
          },
          isActive: actions?.isFavorite ?? false,
        ),*/
        FavoriteButton(isActive: actions?.isFavorite ?? false, isTitle: false),

        SearchActionItem(
          icon: Icons.ios_share,
          onPress: () {
            Navigator.pushNamed(context, "/search/search-categories");
          },
          isActive: actions?.isProfileShare ?? false,
        ),
      ],
    );
  }
}

class SearchActionItem extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPress;
  final bool isActive;

  const SearchActionItem({
    super.key,
    required this.icon,
    required this.onPress,
    required this.isActive,
  });

  @override
  State<SearchActionItem> createState() => _SearchActionItemState();
}

class _SearchActionItemState extends State<SearchActionItem> {
  @override
  Widget build(BuildContext context) {
    return widget.isActive
        ? IconButton(onPressed: widget.onPress, icon: Icon(widget.icon))
        : SizedBox.shrink();
  }
}
