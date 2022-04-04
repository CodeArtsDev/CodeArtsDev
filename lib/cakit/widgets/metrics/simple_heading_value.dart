import 'package:flutter/material.dart';

enum CaMetricType { vertical, verticalCard }

class CaSimpleMetric extends StatelessWidget {
  final List<Widget> metricDetails;
  final CaMetricType metricType;

  const CaSimpleMetric(
      {Key? key,
      required this.metricDetails,
      this.metricType = CaMetricType.verticalCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: metricDetails,
    );
  }
}
