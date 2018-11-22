/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link.fromUri(Uri uri)
 * Creates a Link object.
 *
 * If path is a relative path, it will be interpreted relative to the current
 * working directory (see Directory.current), when used.
 *
 * If path is an absolute path, it will be immune to changes to the current
 * working directory.
 * @description Checks that this constructor creates a Link object from an
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
  Link link = new Link.fromUri(uri);
  Expect.equals(tmp.path, link.path);

  String dirName = getTempDirectoryName();
  uri = new Uri.directory(
      Directory.current.path + Platform.pathSeparator + dirName);
  link = new Link.fromUri(uri);
  Expect.equals(
      Directory.current.path +
          Platform.pathSeparator +
          dirName +
          Platform.pathSeparator,
      link.path);

  uri = new Uri.file(tmpDir.path);
  link = new Link.fromUri(uri);
  Expect.equals(tmpDir.path, link.path);
}
