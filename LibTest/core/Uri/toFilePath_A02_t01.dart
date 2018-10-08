/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toFilePath({bool windows})
 * Returns the file path from a file URI.
 * If the URI ends with a slash (i.e. the last path component is empty)
 * the returned file path will also end with a slash.
 * @description Checks the cases with trailing slash and backslash
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = 'file:///a/b';
  Expect.equals(r'/a/b', Uri.parse(x).toFilePath(windows: false));
  Expect.equals(r'\a\b', Uri.parse(x).toFilePath(windows: true));
  Expect.equals(r'/a/b/', Uri.parse('$x/').toFilePath(windows: false));
  Expect.equals(r'\a\b\', Uri.parse('$x/').toFilePath(windows: true));
}
