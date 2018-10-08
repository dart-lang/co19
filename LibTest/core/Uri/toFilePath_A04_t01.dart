/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toFilePath({bool windows})
 * Returns the file path from a file URI.
 * If the URI is not a file URI calling this throws UnsupportedError.
 * If the URI cannot be converted to a file path calling this throws
 * UnsupportedError.
 * @description Checks that exceptions are thrown
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    Uri.parse('asdf://foo/bar').toFilePath(windows: false);
  }, (e) => e is UnsupportedError);
  
  Expect.throws(() {
    Uri.parse('asdf://foo/bar').toFilePath(windows: true);
  }, (e) => e is UnsupportedError);
}
