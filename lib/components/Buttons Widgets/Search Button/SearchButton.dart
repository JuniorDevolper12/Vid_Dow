import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Walpaper Provider/WalpaperProvider.dart';
import '../../../utils/App Utils/App Colors/Appcolors.dart';

Widget SearchButton() {
  return Consumer<PhotosProvider>(
    builder: (context, value, child) {
      return IconButton(
        onPressed: () => value.EnableSeach(),
        icon: Icon(
          value.showsearch ? Icons.search_off : Icons.search,
          color: value.showsearch ? Colors.grey : appColor,
        ),
      );
    },
  );
}
