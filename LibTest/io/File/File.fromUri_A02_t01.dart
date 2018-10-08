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
 * @description Checks that if uri cannot reference a file object then
 * UnsupportedError is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri(scheme: "http", host: "dartlang.org");
  Expect.throws(() {new File.fromUri(uri);}, (e) => e is UnsupportedError);

  uri = new Uri.http("", "some/path");
  Expect.throws(() {new File.fromUri(uri);}, (e) => e is UnsupportedError);
}
