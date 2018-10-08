/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.file(String path, {bool windows})
 * Creates a new file URI from an absolute or relative file path.
 * If the path starts with a path separator an absolute URI is created.
 * Otherwise a relative URI is created. One exception from this rule is that
 * when Windows semantics is used and the path starts with a drive letter
 * followed by a colon (":") and a path separator then an absolute URI is
 * created.
 * @description Checks cases when absolute and relative URIs are created
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  // relative URIs are created
  Expect.isFalse(new Uri.file(r'a/b', windows: false).isAbsolute);
  Expect.isFalse(new Uri.file(r'a\b', windows: true).isAbsolute);
  
  // absolute URIs are created
  Expect.isTrue(new Uri.file(r'/a/b', windows: false).isAbsolute);
  Expect.isTrue(new Uri.file(r'/a/b', windows: true).isAbsolute);
  Expect.isTrue(new Uri.file(r'\a\b', windows: true).isAbsolute);
  Expect.isTrue(new Uri.file(r'c:/pagefile.sys', windows: true).isAbsolute);
  Expect.isTrue(new Uri.file(r'c:\pagefile.sys', windows: true).isAbsolute);
}
