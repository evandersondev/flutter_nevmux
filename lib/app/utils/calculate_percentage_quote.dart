String calculatePercentageQuote(double quote1, double quote2) {
  final quote1InCents = quote1 * 60;
  final quote2InCents = quote2 * 60;

  return (((quote2InCents - quote1InCents) / quote1InCents) * 100)
      .toStringAsFixed(2);
}
