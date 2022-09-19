import 'package:flutter/material.dart';

SnackBar successfulSnackBar() {
  return SnackBar(
    content: const Text('Image Download Successful'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
}

SnackBar failedSnackBar() {
  return SnackBar(
    content: const Text('Downloading Failed'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
}

SnackBar noDataSnackBar() {
  return SnackBar(
    content: const Text('No Data to show'),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
}
