/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.file(String path, {bool windows})
 * Creates a new file URI from an absolute or relative file path.
 * ...
 * If the path passed is not a legal file path ArgumentError is thrown.
 * @description Checks that ArgumentError is thrown for illegal paths
 * @author ilya
 */
import "../../../Utils/expect.dart";

check(path, {windows: true}) {
  Expect.throws(() {
    new Uri.file(path, windows: windows);
  }, (e) => e is ArgumentError);
}

main() {
  check(':');
  check('c:pagefile.sys');
  check('c:foo/bar');
}
