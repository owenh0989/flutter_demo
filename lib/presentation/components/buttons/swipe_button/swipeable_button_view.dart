import 'package:flutter/material.dart';
import 'package:lumiere_note_sp/presentation/components/buttons/swipe_button/swipeable_widget.dart';

class SwipeableButtonView extends StatefulWidget {
  const SwipeableButtonView(
      {Key? key,
      required this.onFinish,
      required this.onWaitingProcess,
      required this.activeColor,
      required this.buttonWidget,
      required this.buttonText,
      this.isFinished = false,
      this.isActive = true,
      this.disableColor = Colors.grey,
      this.buttonColor = Colors.white,
      this.buttontextstyle =
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      this.indicatorColor = const AlwaysStoppedAnimation<Color>(Colors.white)})
      : super(key: key);
  final VoidCallback onFinish;

  final VoidCallback onWaitingProcess;

  final bool isFinished;

  final bool isActive;

  final Color activeColor;

  final Color? disableColor;

  final Widget buttonWidget;

  final Color? buttonColor;

  final String buttonText;

  final TextStyle? buttontextstyle;

  final Animation<Color?>? indicatorColor;

  @override
  _SwipeableButtonViewState createState() => _SwipeableButtonViewState();
}

class _SwipeableButtonViewState extends State<SwipeableButtonView>
    with TickerProviderStateMixin {
  bool isAccepted = false;
  double opacity = 1;
  bool isFinishValue = false;
  bool isStartRippleEffect = false;
  late AnimationController _controller;

  bool isScaleFinished = false;

  late AnimationController rippleController;
  late AnimationController scaleController;

  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  void init() {
    setState(() {
      isAccepted = false;
      opacity = 1;
      isFinishValue = false;
      isStartRippleEffect = false;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      isFinishValue = widget.isFinished;
    });

    rippleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isFinishValue = true;
              });
              widget.onFinish();
            }
          });
    rippleAnimation =
        Tween<double>(begin: 60, end: 90).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation = Tween<double>(begin: 1, end: 30).animate(scaleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isScaleFinished = true;
          });
        }
      });

    //rippleController.forward();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFinished) {
      setState(() {
        isStartRippleEffect = true;
        isFinishValue = true;
      });
      scaleController.forward();
    } else {
      if (isFinishValue) {
        scaleController.reverse().then((value) {
          init();
        });
      }
    }
    return Container(
      width: isAccepted
          ? (MediaQuery.of(context).size.width -
              ((MediaQuery.of(context).size.width - 60) * _controller.value))
          : double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: widget.isActive ? widget.activeColor : widget.disableColor,
          borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacity,
              child: Text(
                widget.buttonText,
                style: widget.buttontextstyle,
              ),
            ),
          ),
          !isAccepted
              ? SwipeableWidget(
                  isActive: widget.isActive,
                  height: 60,
                  onSwipeValueCallback: (value) {
                    setState(() {
                      opacity = value;
                    });
                  },
                  child: Container(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            elevation: 2,
                            shape: CircleBorder(),
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.buttonColor),
                              child: Center(
                                child: widget.buttonWidget,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onSwipeCallback: () {
                    widget.onWaitingProcess();
                    setState(() {
                      isAccepted = true;
                    });
                    _controller.animateTo(1,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                )
              : AnimatedBuilder(
                  animation: rippleAnimation,
                  builder: (context, child) => Container(
                    width: rippleAnimation.value,
                    height: rippleAnimation.value,
                    child: AnimatedBuilder(
                        animation: scaleAnimation,
                        builder: (context, child) => Transform.scale(
                              scale: scaleAnimation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.activeColor.withOpacity(0.4),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: widget.isActive
                                              ? widget.activeColor
                                              : widget.disableColor),
                                      child: Center(
                                        child: !isFinishValue
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    widget.indicatorColor)
                                            : SizedBox(),
                                      )),
                                ),
                              ),
                            )),
                  ),
                )
        ],
      ),
    );
  }
}
