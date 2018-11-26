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
 * link's location. Test absolute path
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
  Link link = new Link(path);
  if (Platform.isWindows) {
    Expect.equals("/" + path.replaceAll("\\", "/"), link.uri.path);
  } else {
    Expect.equals(path, link.uri.path);
  }
  Expect.equals("file", link.uri.scheme);

  path = tmp.path + ".NotExisting";
  link = new Link(path);
  if (Platform.isWindows) {
    Expect.equals("/" + path.replaceAll("\\", "/"), link.uri.path);
  } else {
    Expect.equals(path, link.uri.path);
  }
  Expect.equals("file", link.uri.scheme);
}
