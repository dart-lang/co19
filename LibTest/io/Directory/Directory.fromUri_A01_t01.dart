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
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory tmp = getTempDirectorySync(parent: sandbox);
  // test existing Directory
  Uri uri = new Uri.directory(tmp.path);
  Directory dir = new Directory.fromUri(uri);
  Expect.equals(tmp.path + Platform.pathSeparator, dir.path);

  // test not existing Directory
  String dirName = getTempDirectoryName();
  uri = new Uri.directory(
      Directory.current.path + Platform.pathSeparator + dirName);
  dir = new Directory.fromUri(uri);
  Expect.equals(
      Directory.current.path +
          Platform.pathSeparator +
          dirName +
          Platform.pathSeparator,
      dir.path);

  // test file
  File file = getTempFileSync(parent: sandbox);
  uri = new Uri.file(file.path);
  dir = new Directory.fromUri(uri);
  Expect.equals(file.path, dir.path);
}
