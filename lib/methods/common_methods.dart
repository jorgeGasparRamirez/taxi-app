import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CommonMethods {
  checkConnectivity(BuildContext context) async {
    var connectionResult = await Connectivity().checkConnectivity();
    if (!connectionResult.contains(ConnectivityResult.mobile) &&
        !connectionResult.contains(ConnectivityResult.wifi)) {
      if (!context.mounted) return;
      displaySnackBar(
          "Your Internet is not available. Check your connection. Try again",
          context);
    }
  }

  displaySnackBar(String message, BuildContext context) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
