part of 'view.dart';

class RaitingStras extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final MainAxisAlignment alignment;

  RaitingStras({
    this.voteAverage = 0,
    this.starSize = 16,
    this.fontSize = 12,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage).round();

    List<Widget> widgets = List.generate(5, (index) {
      return Icon(
        index < n ? Icons.star : Icons.star_border_outlined,
        color: Theme.of(context).primaryColor,
        size: starSize,
      );
    });
    widgets.add(SizedBox(width: 3));
    return Row(
      mainAxisAlignment: alignment,
      children: widgets,
    );
  }
}
