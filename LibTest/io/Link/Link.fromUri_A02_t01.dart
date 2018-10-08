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
 * @description Checks that if uri cannot reference a link object then
 * UnsupportedError is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri(scheme: "http", host: "dartlang.org");
  Expect.throws(() {new Link.fromUri(uri);}, (e) => e is UnsupportedError);

  uri = new Uri.http("", "some/path");
  Expect.throws(() {new Link.fromUri(uri);}, (e) => e is UnsupportedError);
}
