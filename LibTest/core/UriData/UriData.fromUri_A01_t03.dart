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
 * @description Checks that data URI, created by this constructor, has correct
 * properties
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Uri uri = new Uri(scheme: "data", path: "text/plain,some data", query: "a=b&c=d");
  UriData uriData = new UriData.fromUri(uri);

  Expect.equals("US-ASCII", uriData.charset);
  Expect.isFalse(uriData.isBase64);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.equals("some%20data?a=b&c=d", uriData.contentText);
  Expect.mapEquals({}, uriData.parameters);
  Expect.equals(uri, uriData.uri);

  uri = new Uri(scheme: "data", path: "text/plain;base64,some data");
  uriData = new UriData.fromUri(uri);

  Expect.equals("US-ASCII", uriData.charset);
  Expect.isTrue(uriData.isBase64);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.equals("some%20data", uriData.contentText);
  Expect.mapEquals({}, uriData.parameters);
  Expect.equals(uri, uriData.uri);

  uri = new Uri(scheme: "data", path: ";a=b;base64,some data");
  uriData = new UriData.fromUri(uri);

  Expect.equals("US-ASCII", uriData.charset);
  Expect.isTrue(uriData.isBase64);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.equals("some%20data", uriData.contentText);
  Expect.mapEquals({"a": "b"}, uriData.parameters);
  Expect.equals(uri, uriData.uri);

  uri = new Uri(scheme: "data", path: ";charset=utf-8;base64,some data");
  uriData = new UriData.fromUri(uri);

  Expect.equals("utf-8", uriData.charset);
  Expect.isTrue(uriData.isBase64);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.equals("some%20data", uriData.contentText);
  Expect.mapEquals({"charset": "utf-8"}, uriData.parameters);
  Expect.equals(uri, uriData.uri);

  uri = new Uri(scheme: "data", path: ",some data");
  uriData = new UriData.fromUri(uri);

  Expect.equals("US-ASCII", uriData.charset);
  Expect.isFalse(uriData.isBase64);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.equals("some%20data", uriData.contentText);
  Expect.mapEquals({}, uriData.parameters);
  Expect.equals(uri, uriData.uri);
}
