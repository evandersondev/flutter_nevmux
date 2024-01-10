import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:flutter_nexmuv/app/models/crypto_model.dart';
import 'package:flutter_nexmuv/app/utils/calculate_percentage_quote.dart';

class CryptoCardWidget extends StatelessWidget {
  CryptoCardWidget({
    super.key,
    required this.crypto,
    required this.firstQuote,
    required this.penultimateQuote,
  });

  final CryptoModel crypto;
  final double firstQuote;
  final double penultimateQuote;

  final dateFormatted = DateFormat('dd MMMM, yyyy');
  final currencyFormatted = NumberFormat.currency(name: '\$', locale: 'en_US');

  Color quoteColorStyle(String quote) {
    if (quote.contains('-')) {
      return Colors.redAccent;
    }

    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final percentageFrom1Day =
        calculatePercentageQuote(penultimateQuote, crypto.quote);
    final percentageFrom30Day =
        calculatePercentageQuote(firstQuote, crypto.quote);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          currencyFormatted.format(crypto.quote),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        subtitle: Text(
          dateFormatted.format(
            DateTime.fromMillisecondsSinceEpoch(
              crypto.timestamp * 1000,
            ),
          ),
          style: TextStyle(
            color:
                Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: '1D: ',
                children: [
                  TextSpan(
                    text: '$percentageFrom1Day%',
                    style: TextStyle(
                      color: quoteColorStyle(percentageFrom1Day),
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 12,
              ),
            ),
            Text.rich(
              TextSpan(
                text: '1M: ',
                children: [
                  TextSpan(
                    text: '$percentageFrom30Day%',
                    style: TextStyle(
                      color: quoteColorStyle(percentageFrom30Day),
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
