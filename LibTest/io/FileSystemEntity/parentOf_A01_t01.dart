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
/// @description Checks that this method returns the final path component of a
/// path. Test relative paths.
/// @author sgrekhov22@gmail.com

import 'dart:io';
import '../../../Utils/expect.dart';

main() {
  test('a/b/c', 'a/b');
  test('a/b/c/', 'a/b');
  test('a', '.');
  test('../a/', '..');
  test('.', '.');
  test('', '.');
  test('..', '.');
  test('...', '.');
  test('....', '.');
  test(',', '.');
  test('a b/file.txt', 'a b');
  test('a b/file,with comma.txt', 'a b');
  test('a b/dir,with comma/file.txt', 'a b/dir,with comma');
  test('a b:c,d#e;f?g/a b:c,d#e;f?g/', 'a b:c,d#e;f?g');
  test("a'b/c'd", "a'b");
  test('./a', '.');
  test('./', '.');
  test('C:', '.');
}

void test(String path, String expected) {
  Expect.equals(
    toPlatformPath(expected),
    FileSystemEntity.parentOf(toPlatformPath(path)),
  );
}

String toPlatformPath(String path) =>
    path.replaceAll('/', Platform.pathSeparator);
