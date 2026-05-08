// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion parentOf static method
/// ```
/// String parentOf(String path)
/// ```
/// The parent path of a path.
///
/// Finds the final path component of a path, using the platform's path
/// separator to split the path, and returns the prefix up to that part.
///
/// Will not remove the root component of a Windows path, like "C:\" or
/// "\\server_name\". Includes a trailing path separator in the last part of
/// path, and leaves no trailing path separator.
///
/// @description Checks that "\\server_name\" is not removed.
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';

main() {
  final ps = Platform.pathSeparator;
  if (Platform.isWindows) {
    test(r'\\', r'\\');
    test(r'\\server_name', r'\\server_name');
    test(r'\\server_name\', r'\\server_name\');
    test(r'\\server_name\a', r'\\server_name\');
    test(r'\\server_name\a\b', r'\\server_name\a');
    test(r'\\server_name/', r'\\server_name/');
    test(r'//', r'/');
  } else {
    test(r'\\', '.');
    test(r'\\server_name', '.');
    test(r'\\server_name\', '.');
    test(r'\\server_name' + ps, '.');
    test(r'\\server_name' + '${ps}a', r'\\server_name');
    test(r'\\server_name' + '${ps}a${ps}b', r'\\server_name' + '${ps}a');
    test(r'//', r'/');
  }
}

void test(String path, String expected) {
  Expect.equals(expected, FileSystemEntity.parentOf(path));
}
