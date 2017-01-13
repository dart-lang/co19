/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool hasPort
 * Returns whether the URI has an explicit port.
 *
 * If the port number is the default port number (zero for unrecognized schemes,
 * with http (80) and https (443) being recognized), then the port is made
 * implicit and omitted from the URI.
 * @description Checks that this property returns true if the URI has an
 * explicit port.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(path: "index.dart");
  Expect.isFalse(uri.hasPort);
  
  uri = new Uri(port: 123);
  Expect.isTrue(uri.hasPort);

  uri = Uri.parse("https://www.dartlang.org/");
  Expect.isFalse(uri.hasPort);

  uri = Uri.parse("http://www.dartlang.org/");
  Expect.isFalse(uri.hasPort);

  uri = Uri.parse("foo://bar");
  Expect.isFalse(uri.hasPort);

  uri = Uri.parse("/a/b/c/index.dart#mark");
  Expect.isFalse(uri.hasPort);

  uri = Uri.parse("a/b/c/index.dart#mark");
  Expect.isFalse(uri.hasPort);

  uri = Uri.parse("https://www.dartlang.org:123/");
  Expect.isTrue(uri.hasPort);

  uri = Uri.parse("http://www.dartlang.org:123/");
  Expect.isTrue(uri.hasPort);

  uri = Uri.parse("foo://www.dartlang.org:123");
  Expect.isTrue(uri.hasPort);

  uri = Uri.parse("http://www.dartlang.org:123/a/index.dart#mark");
  Expect.isTrue(uri.hasPort);
}
