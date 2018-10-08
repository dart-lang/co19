/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.file(String path, {bool windows})
 * Creates a new file URI from an absolute or relative file path.
 * With non-Windows semantics the slash ("/") is used to separate path
 * segments.
 * @description Checks that forward slash is interpreted as path separator and
 * backward slash is not interpreted as path separator for non-Windows
 * semantics
 * @author ilya
 */
import "../../../Utils/expect.dart";

check(String path) {
  Uri uri = new Uri.file(r'a/b', windows: false);

  Expect.equals("", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals("", uri.query);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
  Expect.equals("a/b", uri.path);
}

main() {
  Expect.equals('a/b', new Uri.file(r'a/b', windows: false).path);
  Expect.notEquals('a/b', new Uri.file(r'a\b', windows: false).path);
  Expect.equals('/a/b', new Uri.file(r'/a/b', windows: false).path);
  Expect.notEquals('/a/b', new Uri.file(r'\a\b', windows: false).path);
  Expect.notEquals('/a/b', new Uri.file(r'/a\b', windows: false).path);
}
