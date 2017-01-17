/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasQuery
 * Returns whether the URI has a query part.
 *
 * @description Checks that this property returns true if the URI has a query
 * part.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasQuery);
  
  uri = new Uri(port: 123);
  Expect.isFalse(uri.hasQuery);

  uri = new Uri(query: "a=1&b=2");
  Expect.isTrue(uri.hasQuery);

  uri = Uri.parse("https://www.dartlang.org/");
  Expect.isFalse(uri.hasQuery);

  uri = Uri.parse("foo://bar");
  Expect.isFalse(uri.hasQuery);

  uri = Uri.parse("/a/b/c/index.dart?a=1#mark");
  Expect.isTrue(uri.hasQuery);

  uri = Uri.parse("a/b/c/index.dart?#mark");
  Expect.isTrue(uri.hasQuery);

  uri = Uri.parse("a/b/c/index.dart?");
  Expect.isTrue(uri.hasQuery);

  uri = Uri.parse("https://www.dartlang.org:123/?x");
  Expect.isTrue(uri.hasQuery);

  uri = Uri.parse("http://www.dartlang.org:123/a/index.dart?a=1#mark");
  Expect.isTrue(uri.hasQuery);
}
