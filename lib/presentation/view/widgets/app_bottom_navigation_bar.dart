import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/resources/styles.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

class AppBottomNavigationItem {
  AppBottomNavigationItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.page,
  });

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final PageRouteInfo page;
}

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
  }) : super(key: key);

  final List<AppBottomNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final TextStyle? selectedTextStyle;
  final TextStyle? unSelectedTextStyle;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final _unSelectedTextStyle = unSelectedTextStyle ??
        AppStyles.bottomNavigation.copyWith(color: Theme.of(context).brightness == Brightness.light ? colorSchema?.grayscaleBodyText : colorSchema?.darkmodeBody);
    final _selectedTextStyle = selectedTextStyle ??
        _unSelectedTextStyle.copyWith(
          color: context.themeOwn().colorSchema?.primaryDefault,
        );
    return Container(
      decoration:Theme.of(context).brightness == Brightness.light ? BoxDecoration(
        boxShadow:
        [
          BoxShadow(
            offset: const Offset(-5, 5),
            color: const Color(0xFFAEAEC0).withOpacity(0.5),
            blurRadius: 20,
          ),
        ],
        color: colorSchema?.grayscaleWhite,
      ) : null,
      child: SafeArea(
        child: Material(
          color:Theme.of(context).colorScheme.background,
          child: _BottomNavigationTile(
            items: items,
            currentIndex: currentIndex,
            onTap: onTap,
            selectedTextStyle: _selectedTextStyle,
            unSelectedTextStyle: _unSelectedTextStyle,
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationTile extends StatelessWidget {
  const _BottomNavigationTile({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
  }) : super(key: key);

  final List<AppBottomNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Expanded(
                child: _Tile(
                  item: e,
                  isSelected: i == currentIndex,
                  onTap: () => onTap?.call(i),
                  selectedTextStyle: selectedTextStyle,
                  unSelectedTextStyle: unSelectedTextStyle,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
  }) : super(key: key);

  final AppBottomNavigationItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          if (isSelected) item.selectedIcon else item.icon,
          const SizedBox(height: 4),
          Text(
            item.label,
            style: isSelected ? selectedTextStyle : unSelectedTextStyle,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}