import 'package:flutter/material.dart';

class Header extends StatefulWidget {

  final TrackingScrollController scrollController;

  const Header( this.scrollController);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _backgroundColor;
  Color _backgroundColorSearch;
  Color _colorIcon;
  double _opacity;
  double _offset;

  final _opacityMax = 0.01;

  @override
  void initState() {
     _backgroundColor = Colors.transparent;
     _backgroundColorSearch = Colors.white;
     _colorIcon = Colors.white;
     _opacity = 0.0  ;
     _offset = 0.0 ;

     widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              _buildInputSearch(),
              SizedBox(width: 20),
              _buildIconButton(
                  onPressed: () => print("click!!"),
                  icon: Icons.shopping_cart,
                  notification: 20,
              ),
              _buildIconButton(
                  onPressed: () => print("click!!"),
                  icon: Icons.chat,
                  notification: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }



  _buildInputSearch() {
    final sizeIcon = BoxConstraints(
      minHeight: 40,
      minWidth: 40,
    );

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "สั่งอาหารทะเลสด",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.deepOrange,
          ),
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: sizeIcon,
          filled: true,
          fillColor: _backgroundColorSearch,
        ),
      ),
    );
  }

  _buildIconButton(
          {VoidCallback onPressed, IconData icon, int notification = 0}) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: _colorIcon,
            iconSize: 28,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding:EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 22,
                      minHeight: 22,
                    ),
                    child: Text(
                      '$notification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );


  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if(scrollOffset >= _offset && scrollOffset > 5) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
    }else if(scrollOffset < 100) {
      _opacity = double.parse((_opacity - _opacityMax).toStringAsFixed(2));
      if (_opacity <= 1.0) {
        _opacity = 0.0;
      }
    }
    setState(() {
      if(scrollOffset <= 0){
        _backgroundColorSearch = Colors.white;
        _colorIcon = Colors.white;
        _offset = 0.0;
        _opacity =0.0;
      }else{
        _backgroundColorSearch = Colors.grey[200];
        _colorIcon = Colors.deepOrange;
      }

      _backgroundColor = Colors.white.withOpacity(_opacity);
    }
    );
  }
}
