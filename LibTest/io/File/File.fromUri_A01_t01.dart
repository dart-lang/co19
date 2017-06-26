/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion File.fromUri(Uri uri)
 * Create a File object from a URI.
 *
 * If uri cannot reference a file this throws UnsupportedError.
 * @description Checks that this constructor creates a File object from a
 * URI.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri.file(Directory.current.path +
      Platform.pathSeparator + "TestDir" + Platform.pathSeparator + "tmp.dart");
  File file = new File.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator + "TestDir"
      + Platform.pathSeparator + "tmp.dart", file.path);

  uri = new Uri.directory(Directory.current.path +
      Platform.pathSeparator + "NotExistentDir");
  file = new File.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator +
      "NotExistentDir" + Platform.pathSeparator, file.path);

  uri = new Uri.file(Directory.current.path +
      Platform.pathSeparator + "TestDir");
  file = new File.fromUri(uri);
  Expect.equals(Directory.current.path + Platform.pathSeparator +
      "TestDir", file.path);
}
