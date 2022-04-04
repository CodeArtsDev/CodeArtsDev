import 'dart:async';
import 'dart:ui';
import 'page_indicator.dart';
import 'package:flutter/material.dart';

class PageDragger extends StatefulWidget {
  final bool? canDragLeftToRight;
  final bool? canDragRightToLeft;

  final StreamController<SlideUpdate>? slideUpdateStream;

  const PageDragger({
    Key? key,
    this.canDragLeftToRight,
    this.canDragRightToLeft,
    this.slideUpdateStream,
  }) : super(key: key);

  @override
  _PageDraggerState createState() => _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {
  static const fullTransitionPx = 300.0;

  Offset? dragStart;
  SlideDirection? slideDirection;
  double slidePercent = 0.0;

  onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final dx = dragStart!.dx - newPosition.dx;

      if (dx > 0 && widget.canDragRightToLeft == true) {
        slideDirection = SlideDirection.rightToLeft;
      } else if (dx < 0 && widget.canDragLeftToRight == true) {
        slideDirection = SlideDirection.leftToRight;
      } else {
        slideDirection = SlideDirection.none;
      }

      if (slideDirection != SlideDirection.none) {
        slidePercent = (dx / fullTransitionPx).abs().clamp(0.0, 1.0);
      } else {
        slidePercent = 0.0;
      }
      widget.slideUpdateStream!
          .add(SlideUpdate(UpdateType.dragging, slideDirection!, slidePercent));
    }
  }

  onDragEnd(DragEndDetails details) {
    widget.slideUpdateStream!.add(SlideUpdate(
      UpdateType.doneDragging,
      SlideDirection.none,
      0.0,
    ));

    dragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}

class AnimatedPageDragger {
  static const percentPerMilliSecond = 0.005;

  final SlideDirection slideDirection;
  final TransitionGoal transitionGoal;

  late AnimationController completionAnimationController;

  AnimatedPageDragger({
    required this.slideDirection,
    required this.transitionGoal,
    slidePercent,
    StreamController<SlideUpdate>? slideUpdateStream,
    required TickerProvider vsync,
  }) {
    final startSlidePercent = slidePercent;
    double? endSlidePercent;
    Duration? duration;

    if (transitionGoal == TransitionGoal.open) {
      endSlidePercent = 1.0;

      final slideRemaining = 1.0 - slidePercent;

      duration = Duration(
          milliseconds: (slideRemaining / percentPerMilliSecond).round());
    } else {
      endSlidePercent = 0.0;
      duration = Duration(
          milliseconds: (slidePercent / percentPerMilliSecond).round());
    }

    completionAnimationController =
        AnimationController(duration: duration, vsync: vsync)
          ..addListener(() {
            slidePercent = lerpDouble(startSlidePercent, endSlidePercent,
                completionAnimationController.value);

            slideUpdateStream!.add(SlideUpdate(
              UpdateType.animating,
              slideDirection,
              slidePercent,
            ));
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              slideUpdateStream!.add(SlideUpdate(
                UpdateType.doneAnimating,
                slideDirection,
                endSlidePercent!,
              ));
            }
          });
  }

  run() {
    completionAnimationController.forward(from: 0.0);
  }

  dispose() {
    completionAnimationController.dispose();
  }
}

enum TransitionGoal {
  open,
  close,
}

enum UpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

class SlideUpdate {
  final UpdateType updateType;
  final SlideDirection direction;
  final double slidePercent;

  SlideUpdate(this.updateType, this.direction, this.slidePercent);
}
