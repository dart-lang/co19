/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 * @description Checks that parsed string representation of some Uri is the same
 * Uri
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Uri uri1 = new Uri(scheme: "scheme", host: "host", userInfo: "user:info",
      port: 8080, path: "some path", query: "query", fragment: "fragment");
  Uri uri2 = Uri.parse(uri1.toString());
  Expect.isTrue(uri1 == uri2);

  uri1 = new Uri(scheme: "scheme", host: "host", userInfo: "user:info",
      port: 8080, path: "some path", query: "some query = й", fragment: "frgm");
  uri2 = Uri.parse(uri1.toString());
  Expect.isTrue(uri1 == uri2);
}
