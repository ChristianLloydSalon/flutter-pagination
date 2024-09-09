import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitch<T> extends StatelessWidget {
  const CustomToggleSwitch({
    required this.current,
    required this.first,
    required this.second,
    required this.firstIcon,
    required this.firstColor,
    required this.secondIcon,
    required this.secondColor,
    required this.onTap,
    this.onChanged,
    super.key,
  });

  final T current;
  final T first;
  final T second;

  final Widget firstIcon;
  final Color firstColor;
  final Widget secondIcon;
  final Color secondColor;

  final void Function(TapProperties<T>) onTap;
  final void Function(T)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<T>.dual(
      current: current,
      first: first,
      second: second,
      iconBuilder: (value) => value == first ? firstIcon : secondIcon,
      styleBuilder: (value) => ToggleStyle(
        backgroundColor: value == first ? firstColor : secondColor,
      ),
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
