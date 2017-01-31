/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toFilePath({bool windows})
 * Returns the file path from a file URI.
 * For non-Windows semantics the slash ("/") is used to separate path segments.
 * For Windows semantics the backslash ("\") separator is used to separate
 * path segments.
 * If the URI is absolute the path starts with a path separator unless Windows
 * semantics is used and the first path segment is a drive letter. When Windows
 * semantics is used a host component in the uri in interpreted as a file
 * server and a UNC path is returned.
 * @description Checks the case with UNC path for Windows semantics
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(r'\\host\a\b',
      Uri.parse('file://host/a/b').toFilePath(windows: true));
}
