/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.file(String path, {bool windows})
 * Creates a new file URI from an absolute or relative file path.
 * With Windows semantics, backslash ("\") and forward-slash ("/") are used to
 * separate path segments, except if the path starts with "\\?\" in which case
 * only backslash ("\") separates path segments.
 * @description Checks that both forward slash and backward slashes are
 * interpreted as path separator for Windows semantics
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "UriDataEncoder.lib.dart";

check(String path) {
  Uri uri = new Uri.file(path, windows: true);

  Expect.equals((path.startsWith("/") ||  path.startsWith(r"\")) ? "file" : "",
      uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals("", uri.query);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
  Expect.equals(encodeString(path.replaceAll(r"\", "/"),
      encoding: Encoding.getByName("utf-8")), uri.path);
}

main() {
  check("");
  check(" ");
  check(" a ");

  check(r"a/b");
  check(r"a\b");
  check(r"/a/b");
  check(r"\a\b");
  check(r"/a\b");

  check(r" a / b ");
  check(r" a \ b ");
  check(r"/a / b ");
  check(r"\ a \ b ");

  check(r" й / ф ");
  check(r" й \ ф ");
  check(r"/ й / ф ");
  check(r"\ й \ ф ");
}
