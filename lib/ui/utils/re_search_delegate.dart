import 'package:flutter/material.dart';

class ReSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      CloseButton(onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton(onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final trimQuery = query.trim();
    if (trimQuery != '') {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        close(context, query);
      });
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
