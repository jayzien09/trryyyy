import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function touched;
  final bool active;
  const NavBarItem({
    required this.icon,
    required this.text,
    required this.touched,
    required this.active,
  });
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.touched();
        },
        splashColor: AppColors.white,
        hoverColor: Colors.transparent, //or AppColors.GreyAccent
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            children: [
              SizedBox(
                height: 40.0,
                //width: 1000,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 475),
                      height: 30.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                        color: widget.active
                            ? AppColors.blueAccent
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Icon(
                        widget.icon,
                        color: widget.active
                            ? AppColors.blueAccent
                            : AppColors.grey,
                        size: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        widget.text,
                        style: AppTextStyles.title.copyWith(
                          color:
                              widget.active ? AppColors.black : AppColors.grey,
                          fontSize: 15.0,
                          fontWeight: widget.active
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
