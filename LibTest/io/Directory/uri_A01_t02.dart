/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri uri
 * Returns a Uri representing the directory's location.
 *
 * The returned URI's scheme is always "file" if the entity's path is absolute,
 * otherwise the scheme will be empty. The returned URI's path always ends in a
 * slash ('/').
 * @description Checks that this property returns a Uri representing the
 * directory's location. Test absolute path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory dir = sandbox;
  if (Platform.isWindows) {
    Expect.equals("/" + dir.path.replaceAll("\\", "/") + "/", dir.uri.path);
  } else {
    Expect.equals(dir.path + "/", dir.uri.path);
  }
  Expect.equals("file", dir.uri.scheme);

  String path = dir.path + Platform.pathSeparator + "NotExisting";
  Directory dir2 = new Directory(path);
  if (Platform.isWindows) {
    Expect.equals("/" + path.replaceAll("\\", "/") + "/", dir2.uri.path);
  } else {
    Expect.equals(path + "/", dir2.uri.path);
  }
  Expect.equals("file", dir2.uri.scheme);
}
