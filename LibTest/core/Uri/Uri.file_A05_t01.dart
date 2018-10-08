/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Uri.file(String path, {bool windows})
 * Creates a new file URI from an absolute or relative file path.
 * ...
 * @description Checks that scheme is added for absolute paths
 * @issue 28659
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri.file(r"/xxx/yyy", windows: false);
  Expect.equals(r"/xxx/yyy", uri.path);
  Expect.equals("file", uri.scheme);

  uri = new Uri.file(r"/xxx/yyy", windows: true);
  Expect.equals(r"/xxx/yyy", uri.path);
  Expect.equals("file", uri.scheme);

  uri = new Uri.file(r"C:\xxx\yyy", windows: true);
  Expect.equals(r"/C:/xxx/yyy", uri.path);
  Expect.equals("file", uri.scheme);

  uri = new Uri.file(r"\xxx\yyy", windows: true);
  Expect.equals(r"/xxx/yyy", uri.path);
  Expect.equals("file", uri.scheme);

  uri = new Uri.file(r"\xxx\yyy", windows: true);
  Expect.equals(r"/xxx/yyy", uri.path);
  Expect.equals("file", uri.scheme);

  uri = new Uri.file(r"\\server\share\file", windows: true);
  Expect.equals(r"/share/file", uri.path);
  Expect.equals(r"server", uri.host);
  Expect.equals("file", uri.scheme);
}
