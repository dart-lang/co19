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
 * @description Checks that ArgumentError is thrown for illegal paths
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(path, {windows: true}) {
  Expect.throws(() {
    new Uri.directory(path, windows: windows);
  }, (e) => e is ArgumentError);
}

main() {
  check(':');
  check('c:pagefile.sys');
  check('c:foo/bar');
}
