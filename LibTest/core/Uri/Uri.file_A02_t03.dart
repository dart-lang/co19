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
 * @description Checks that if the path starts with "\\?\" then
 * only backslash ("\") separates path segments
 * @issue 28659
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri.file(r"\\?\c:\a\b", windows: true);
  Expect.equals("\c:\a\b", uri.path);
}
