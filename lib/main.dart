import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartProvider.dart';
import 'myapp.dart';

main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(), child: MyApp()),
  );
}
