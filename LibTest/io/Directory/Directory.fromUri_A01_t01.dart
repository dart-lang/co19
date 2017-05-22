/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory.fromUri(Uri uri)
 * Create a Directory object from a URI.
 *
 * If uri cannot reference a directory this throws UnsupportedError.
 * @description Checks that this constructor creates a Directory object from a
 * URI.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri.directory(Directory.current.path +
      Platform.pathSeparator + "TestDir");
  Directory dir = new Directory.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator + "TestDir"
      + Platform.pathSeparator, dir.path);

  uri = new Uri.directory(Directory.current.path +
      Platform.pathSeparator + "NotExistentDir");
  dir = new Directory.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator +
      "NotExistentDir" + Platform.pathSeparator, dir.path);

  uri = new Uri.file(Directory.current.path +
      Platform.pathSeparator + "TestDir" + Platform.pathSeparator + "tmp.dart");
  dir = new Directory.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator +
      "TestDir" + Platform.pathSeparator + "tmp.dart", dir.path);
}
