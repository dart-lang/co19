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
 * file's location. Test absolute path
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
  String path = tmp.path;
  File file = new File(path);
  if (Platform.isWindows) {
    Expect.equals("/" + path.replaceAll("\\", "/"), file.uri.path);
  } else {
    Expect.equals(path, file.uri.path);
  }
  Expect.equals("file", file.uri.scheme);

  path = tmp.path + ".NotExisting";
  file = new File(path);
  if (Platform.isWindows) {
    Expect.equals("/" + path.replaceAll("\\", "/"), file.uri.path);
  } else {
    Expect.equals(path, file.uri.path);
  }
  Expect.equals("file", file.uri.scheme);
}
