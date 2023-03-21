import 'package:flutter/material.dart';

typedef SwipeValueCallBack(double value);

class SwipeableWidget extends StatefulWidget {
  SwipeableWidget(
      {Key? key,
      required this.child,
      required this.height,
      required this.onSwipeCallback,
      required this.onSwipeValueCallback,
      required this.isActive,
      this.swipePercentageNeeded = 0.75})
      : assert(child != null &&
            onSwipeCallback != null &&
            swipePercentageNeeded <= 1.0),
        super(key: key);
  final Widget child;

  final double height;

  final VoidCallback onSwipeCallback;

  final SwipeValueCallBack onSwipeValueCallback;

  final double swipePercentageNeeded;

  final bool isActive;

  @override
  _SwipeableWidgetState createState() => _SwipeableWidgetState();
}

class _SwipeableWidgetState extends State<SwipeableWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dxStartPosition = 0.0;
  var _dxEndsPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });

    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanStart: (details) {
          setState(() {
            _dxStartPosition = details.localPosition.dx;
          });
        },
        onPanUpdate: (details) {
          if (widget.isActive) {
            final widgetSize = context.size!.width;

            final minimumXToStartSwiping = widgetSize * 0.25;
            if (_dxStartPosition <= minimumXToStartSwiping) {
              setState(() {
                _dxEndsPosition = details.localPosition.dx;
              });
// 76 + 4 + 4 = 84
              final widgetSize = context.size!.width;
              final swipeValue = 60.0 / widgetSize;
              final lastSize = widgetSize;
              final val = 1 - ((details.localPosition.dx) / lastSize);
              _controller.value = val < swipeValue ? swipeValue : val;
              widget.onSwipeValueCallback(_controller.value - swipeValue);
            }
          }
        },
        onPanEnd: (details) async {
          if (widget.isActive) {
            final delta = _dxEndsPosition - _dxStartPosition;
            final widgetSize = context.size!.width;
            var deltaNeededToBeSwiped =
                widgetSize * widget.swipePercentageNeeded;
            deltaNeededToBeSwiped -= 60.0;
            final swipeValue = 60.0 / widgetSize;
            if (delta > deltaNeededToBeSwiped) {
              await _controller.animateTo(swipeValue,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
              widget.onSwipeCallback();
            } else {
              await _controller.animateTo(1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
              widget.onSwipeValueCallback(1);
            }
          }
        },
        child: Container(
          height: widget.height,
          child: Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: _controller.value,
              heightFactor: 1,
              child: widget.child,
            ),
          ),
        ));
  }
}
