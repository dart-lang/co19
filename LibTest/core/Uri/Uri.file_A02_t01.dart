/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals('a/b', new Uri.file(r'a/b', windows: true).path);
  Expect.equals('a/b', new Uri.file(r'a\b', windows: true).path);
  Expect.equals('/a/b', new Uri.file(r'/a/b', windows: true).path);
  Expect.equals('/a/b', new Uri.file(r'\a\b', windows: true).path);
  Expect.equals('/a/b', new Uri.file(r'/a\b', windows: true).path);
}
