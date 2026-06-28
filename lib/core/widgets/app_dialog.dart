import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppDialog {
  static void showLoadingUi(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (context) => PopScope(
        // canPop: false,
        child: AlertDialog(
          backgroundColor: AppColors.background,
          content: SizedBox(
            height: 40,
            width: 40,
            child: Center(
              child: Row(
                spacing: 30,
                mainAxisAlignment: .center,
                children: [
                  CircularProgressIndicator(color: AppColors.black),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void showErrorUi({
    required BuildContext context,
    required String error,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text("Error"),
        content: Text(
          error,
          style: TextStyle(fontSize: 16, fontWeight: .w400, color: Colors.red),
        ),
      ),
    );
  }
}
