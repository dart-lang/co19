/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toFilePath({bool windows})
 * Returns the file path from a file URI.
 * With Windows semantics URIs starting with a drive letter cannot be
 * relative to the current drive on the designated drive. That is for the
 * URI file:///c:abc calling toFilePath will throw as a path segment cannot
 * contain colon on Windows.
 * @description Checks that exception is thrown for file:///c:abc on Windows
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Uri.parse('file:///c:abc').toFilePath(windows: true);
  });
}
