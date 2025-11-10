import 'package:flutter/material.dart';

class SnapScrollPhysics extends ScrollPhysics {
  final double snapPosition;

  const SnapScrollPhysics({
    ScrollPhysics? parent,
    this.snapPosition = 0.5,
  }) : super(parent: parent);

  @override
  SnapScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnapScrollPhysics(
      parent: buildParent(ancestor),
      snapPosition: snapPosition,
    );
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position,
      double velocity,
      ) {
    // If already at bounds, use default behavior
    if ((velocity.abs() >= 0 && position.pixels >= position.maxScrollExtent) ||
        (velocity.abs() >= 0 && position.pixels <= position.minScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    // Determine snap target
    final double snapTarget = velocity > 0
        ? position.maxScrollExtent
        : position.minScrollExtent;

    // Create simulation to snap to target
    return ScrollSpringSimulation(
      spring,
      position.pixels,
      snapTarget,
      velocity,
      tolerance: tolerance,
    );
  }
}
