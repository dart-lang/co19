/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasEmptyPath
 * Returns whether the URI has an empty path.
 * @description Checks that this property returns true if the URI has an empty
 * path.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasEmptyPath);
  
  uri = new Uri(port: 123);
  Expect.isTrue(uri.hasEmptyPath);
  
  uri = new Uri(path: "/index.dart");
  Expect.isFalse(uri.hasEmptyPath);

  uri = new Uri(path: "/");
  Expect.isFalse(uri.hasEmptyPath);

  uri = new Uri(path: "");
  Expect.isTrue(uri.hasEmptyPath);

  uri = Uri.parse("foo:bar");
  Expect.isFalse(uri.hasEmptyPath);

  uri = Uri.parse("foo:/");
  Expect.isFalse(uri.hasEmptyPath);

  uri = Uri.parse("foo: ");
  Expect.isTrue(uri.hasEmptyPath);

  uri = Uri.parse("foo: /");
  Expect.isTrue(uri.hasEmptyPath);

  uri = Uri.parse("foo:");
  Expect.isTrue(uri.hasEmptyPath);
}
