class ViewportConfig {
  const ViewportConfig({
    this.minViewportSize = 320,
    this.maxViewportSize = 1500,
  });

  //copy with
  ViewportConfig copyWith({
    double? minViewportSize,
    double? maxViewportSize,
  }) {
    return ViewportConfig(
      minViewportSize: minViewportSize ?? this.minViewportSize,
      maxViewportSize: maxViewportSize ?? this.maxViewportSize,
    );
  }

  /// The minimum viewport size in which the fluid sizes should be calculated.
  /// This is usually the smallest phone size.
  /// Defaults to 320.
  final double minViewportSize;

  /// The maximum viewport size in which the fluid sizes should be calculated.
  /// This is usually the largest desktop size.
  /// Defaults to 1500.
  final double maxViewportSize;
}
