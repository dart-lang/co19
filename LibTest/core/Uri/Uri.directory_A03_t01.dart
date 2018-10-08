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
 * @description Checks cases when absolute and relative URIs are created
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  // relative URIs are created
  Expect.isFalse(new Uri.directory(r'a/b', windows: false).isAbsolute);
  Expect.isFalse(new Uri.directory(r'a\b', windows: true).isAbsolute);
  
  // absolute URIs are created
  Expect.isTrue(new Uri.directory(r'/a/b', windows: false).isAbsolute);
  Expect.isTrue(new Uri.directory(r'/a/b', windows: true).isAbsolute);
  Expect.isTrue(new Uri.directory(r'\a\b', windows: true).isAbsolute);
  Expect.isTrue(new Uri.directory(r'c:/pagefile.sys', windows: true).isAbsolute);
  Expect.isTrue(new Uri.directory(r'c:\pagefile.sys', windows: true).isAbsolute);
}
