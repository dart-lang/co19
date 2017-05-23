/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 *  final
 * Gets the path of this directory.
 * @description Checks that this property returns the path of this directory.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Directory dir = new Directory("TestDir");
  Expect.equals("TestDir", dir.path);

  dir = new Directory("NotExist");
  Expect.equals("NotExist", dir.path);

  dir = new Directory(
      Directory.current.path + Platform.pathSeparator + "TestDir");
  Expect.equals(
      Directory.current.path + Platform.pathSeparator + "TestDir", dir.path);
}
