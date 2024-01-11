import 'package:flutter/material.dart';

import 'package:flutter_nexmuv/app/pages/crypto/crypto_page.dart';

class SymbolCardWidget extends StatelessWidget {
  const SymbolCardWidget({
    super.key,
    required this.symbolName,
    required this.symbolLegend,
    required this.onTap,
  });

  final String symbolName;
  final String symbolLegend;
  final Function({required BuildContext context, required String symbolName})
      onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          symbolName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
        subtitle: Text(
          symbolLegend,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12,
            color:
                Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.5),
          ),
        ),
        leading: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            child: Text(
              '${symbolName[0]}${symbolName[1]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            )),
        trailing: Icon(
          Icons.chevron_right,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        onTap: () => onTap(context: context, symbolName: symbolName),
      ),
    );
  }
}
