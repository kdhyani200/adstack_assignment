import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/colors.dart';
import '../data/mock_data.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Over All Performance\nThe Years",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    height: 1.3,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              _legendDot("Pending", AppColors.chartPending),
              const SizedBox(width: 12),
              _legendDot("Project Done", AppColors.chartDone),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: _LineChartPainter(
                    pending: MockData.pendingSeries,
                    done: MockData.doneSeries,
                    labels: MockData.chartYears,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendDot(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10.5,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final List<double> pending;
  final List<double> done;
  final List<String> labels;

  _LineChartPainter({
    required this.pending,
    required this.done,
    required this.labels,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double bottomAxis = 24;
    const double leftAxis = 26;
    final chartWidth = size.width - leftAxis;
    final chartHeight = size.height - bottomAxis;

    final maxValue = 50.0;
    final gridPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 1;

    final labelStyle = GoogleFonts.poppins(
      fontSize: 9,
      color: AppColors.textSecondary,
    );

    for (int i = 0; i <= 5; i++) {
      final y = chartHeight - (chartHeight * (i * 10) / maxValue);
      canvas.drawLine(Offset(leftAxis, y), Offset(size.width, y), gridPaint);
      final tp = TextPainter(
        text: TextSpan(text: "${i * 10}", style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(0, y - tp.height / 2));
    }

    final stepX = chartWidth / (labels.length - 1);
    for (int i = 0; i < labels.length; i++) {
      final tp = TextPainter(
        text: TextSpan(text: labels[i], style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      final x = leftAxis + stepX * i;
      tp.paint(canvas, Offset(x - tp.width / 2, chartHeight + 6));
    }

    _drawSeries(
      canvas,
      pending,
      AppColors.chartPending,
      leftAxis,
      chartWidth,
      chartHeight,
      maxValue,
    );
    _drawSeries(
      canvas,
      done,
      AppColors.chartDone,
      leftAxis,
      chartWidth,
      chartHeight,
      maxValue,
    );
  }

  void _drawSeries(
    Canvas canvas,
    List<double> values,
    Color color,
    double leftAxis,
    double chartWidth,
    double chartHeight,
    double maxValue,
  ) {
    final stepX = chartWidth / (values.length - 1);
    final points = <Offset>[
      for (int i = 0; i < values.length; i++)
        Offset(
          leftAxis + stepX * i,
          chartHeight - (chartHeight * values[i] / maxValue),
        ),
    ];

    final linePaint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = _smoothPath(points);
    canvas.drawPath(path, linePaint);

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [color.withValues(alpha: 0.18), color.withValues(alpha: 0.0)],
      ).createShader(Rect.fromLTWH(0, 0, chartWidth, chartHeight));

    final fillPath = Path()
      ..addPath(path, Offset.zero)
      ..lineTo(points.last.dx, chartHeight)
      ..lineTo(points.first.dx, chartHeight)
      ..close();
    canvas.drawPath(fillPath, fillPaint);

    final dotPaint = Paint()..color = color;
    final dotBorderPaint = Paint()..color = Colors.white;
    for (final p in points) {
      canvas.drawCircle(p, 4, dotPaint);
      canvas.drawCircle(p, 2.2, dotBorderPaint);
    }
  }

  Path _smoothPath(List<Offset> points) {
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 0; i < points.length - 1; i++) {
      final p0 = points[i];
      final p1 = points[i + 1];
      final mid = Offset((p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2);
      path.quadraticBezierTo(p0.dx, p0.dy, mid.dx, mid.dy);
    }
    path.lineTo(points.last.dx, points.last.dy);
    return path;
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) => false;
}
