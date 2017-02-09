/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData.fromUri(Uri uri)
 * Creates a DataUri from a Uri which must have data as Uri.scheme.
 *
 * The uri must have scheme data and no authority or fragment, and the path
 * (concatenated with the query, if there is one) must be valid as data URI
 * content with the same rules as parse.
 * @description Checks that this constructor creates an expected UriData. Test
 * valid Uri
 * @issue 28700
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(Uri uri, String expected) {
  UriData uriData = new UriData.fromUri(uri);
  Expect.equals(expected, uriData.toString());
}

main() {
  check(Uri.parse("data:text/plain,some data"), "data:text/plain,some%20data");
  check(Uri.parse("data:,some data"), "data:,some%20data");
  check(new Uri(scheme: "data", path: "text/plain,some%20data"),
      "data:text/plain,some%20data");
  check(new Uri(scheme: "data", path: "text/plain,some data", query: "a=b&c=d"),
      "data:text/plain,some%20data?a=b&c=d");
  check(new Uri(scheme: "data", path: "text/plain,путь", query: "a=b&й=ф"),
      "data:text/plain,%D0%BF%D1%83%D1%82%D1%8C?a=b&%D0%B9=%D1%84");
}
