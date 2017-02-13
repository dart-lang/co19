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
 * Uri, which is not valid for data Uri
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  // no scheme
  Expect.throws(() {
    new UriData.fromUri(new Uri(path: "text/plain,some data", query: "a=b"));
  });

  // wrong scheme
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", path: "text/plain,some data",
        query: "a=b"));
  });

  // uri has authority
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", userInfo: "user:pass",
        path: "text/plain,some data", query: "a=b"));
  });

  // uri has authority
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", userInfo: "user",
        path: "text/plain,some data", query: "a=b"));
  });

  // uri has authority
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", userInfo: ":pass",
        path: "text/plain,some data", query: "a=b"));
  });

  // uri has authority
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", host: "host",
        path: "text/plain,some data", query: "a=b"));
  });

  // uri has authority
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", port: 8080,
        path: "text/plain,some data", query: "a=b"));
  });

  // uri has fragment
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", fragment: "frgmt",
        path: "text/plain,some data", query: "a=b"));
  });

  // path has wrong content
  Expect.throws(() {
    new UriData.fromUri(new Uri(scheme: "http", userInfo: "user:pass",
        path: "text/plain,some data", query: "a=b"));
  });

}
