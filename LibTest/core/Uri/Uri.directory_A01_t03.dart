/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri.directory(String path, {bool windows})
 * Like Uri.file except that a non-empty URI path ends in a slash.
 * If path is not empty, and it doesn't end in a directory separator, then a
 * slash is added to the returned URI's path. In all other cases, the result is
 * the same as returned by Uri.file
 * @description Checks that forward slash is interpreted as path separator and
 * backward slash is not interpreted as path separator for non-Windows
 * semantics. Also checks that that returned URI is always ends with a slash
 * @issue 28660
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "UriDataEncoder.lib.dart";

check(String path) {
  Uri uri = new Uri.directory(path, windows: false);

  Expect.equals(path.startsWith("/") ? "file" : "", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals("", uri.query);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
  String expected = Uri.encodeComponent(path);
  if (!expected.endsWith("/")) {
    expected = expected + "/";
  }
  Expect.equals(expected, uri.path);
}

main() {
  check(r"c:");
  check(r"c:\");
  check(r"c: ");
  check(r"c: \");
}
