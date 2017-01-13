/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasAbsolutePath
 * Returns whether the URI has an absolute path (starting with '/').
 * @description Checks that this property returns true if the URI
 * has an absolute path (starting with '/')
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasAbsolutePath);
  
  uri = new Uri(port: 123);
  Expect.isFalse(uri.hasAbsolutePath);
  
  uri = new Uri(path: "/index.dart");
  Expect.isTrue(uri.hasAbsolutePath);

  uri = new Uri(path: "/");
  Expect.isTrue(uri.hasAbsolutePath);

  uri = new Uri(path: " /index.dart");
  Expect.isFalse(uri.hasAbsolutePath);

  uri = new Uri(path: " /");
  Expect.isFalse(uri.hasAbsolutePath);

  uri = new Uri(path: "//");
  Expect.isTrue(uri.hasAbsolutePath);

  uri = new Uri(path: "https://www.dartlang.org/");
  Expect.isFalse(uri.hasAbsolutePath);

  uri = Uri.parse("foo:bar");
  Expect.isFalse(uri.hasAbsolutePath);

  uri = Uri.parse("foo:/bar");
  Expect.isTrue(uri.hasAbsolutePath);

  uri = Uri.parse("foo:/");
  Expect.isTrue(uri.hasAbsolutePath);

  uri = Uri.parse("foo: /");
  Expect.isFalse(uri.hasAbsolutePath);
}
