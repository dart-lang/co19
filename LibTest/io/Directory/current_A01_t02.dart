/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory current
 * Creates a directory object pointing to the current working directory.
 * @description Checks that this property can be set to a new directory.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  Directory dir = getTempDirectorySync();
  String oldPath = Directory.current.path;
  try {
    Directory.current = dir;
    Expect.isNotNull(Directory.current);
    Expect.isTrue(Directory.current is Directory);
    Expect.equals(dir.path, Directory.current.path);
  } finally {
    Directory.current = new Directory(oldPath);
    dir.delete(recursive: true);
  }
}
