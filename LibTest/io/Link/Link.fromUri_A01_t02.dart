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
 * @description Checks that if path is a relative path, it will be interpreted
 * relative to the current working directory, when used.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() {
  Uri uri = new Uri(path: "tmp.tmp");
  Link link = new Link.fromUri(uri);

  Expect.equals(Directory.current.path + Platform.pathSeparator + "tmp.tmp",
      link.absolute.path);
}
