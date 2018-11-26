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
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  File tmp = getTempFileSync(parent: sandbox);
  Directory tmpDir = getTempDirectorySync(parent: sandbox);
  Uri uri = new Uri.file(tmp.path);
  File file = new File.fromUri(uri);
  Expect.equals(tmp.path, file.path);

  String dirName = getTempDirectoryName();
  uri = new Uri.directory(
      Directory.current.path + Platform.pathSeparator + dirName);
  file = new File.fromUri(uri);
  Expect.equals(
      Directory.current.path +
          Platform.pathSeparator +
          dirName +
          Platform.pathSeparator,
      file.path);

  uri = new Uri.file(tmpDir.path);
  file = new File.fromUri(uri);
  Expect.equals(tmpDir.path, file.path);
}
