/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasScheme
 * Returns whether the URI has a scheme component.
 *
 * @description Checks that this property returns true if the URI has a scheme
 * component.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasScheme);

  uri = new Uri(path: "foo://bar");
  Expect.isFalse(uri.hasScheme);

  uri = new Uri(port: 123);
  Expect.isFalse(uri.hasScheme);

  uri = new Uri(query: "a=1&b=2");
  Expect.isFalse(uri.hasScheme);

  uri = new Uri(scheme: "http");
  Expect.isTrue(uri.hasScheme);

  uri = new Uri(scheme: "foo");
  Expect.isTrue(uri.hasScheme);

  uri = new Uri(scheme: "HTTPS");
  Expect.isTrue(uri.hasScheme);

  uri = Uri.parse("https://www.dartlang.org/");
  Expect.isTrue(uri.hasScheme);

  uri = Uri.parse("foo://bar");
  Expect.isTrue(uri.hasScheme);

  uri = Uri.parse("/a/b/c/index.dart?a=1#mark");
  Expect.isFalse(uri.hasScheme);

  uri = Uri.parse("a/b/c/index.dart?#mark");
  Expect.isFalse(uri.hasScheme);

  uri = Uri.parse("a/b/c/index.dart?");
  Expect.isFalse(uri.hasScheme);

  uri = Uri.parse("https://www.dartlang.org:123/?x");
  Expect.isTrue(uri.hasScheme);

  uri = Uri.parse("http://www.dartlang.org:123/a/index.dart?a=1#mark");
  Expect.isTrue(uri.hasScheme);
}
