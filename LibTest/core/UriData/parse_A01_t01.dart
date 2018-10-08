/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData parse(String uri)
 * Parses a string as a data URI.
 *
 * The string must have the format:
 *
 * 'data:' (type '/' subtype)? (';' attribute '=' value)* (';base64')? ',' data
 * where type, subtype, attribute and value are specified in RFC-2045, and data
 * is a sequence of URI-characters (RFC-2396 uric).
 *
 * This means that all the characters must be ASCII, but the URI may contain
 * percent-escapes for non-ASCII byte values that need an interpretation to be
 * converted to the corresponding string.
 *
 * Parsing doesn't check the validity of any part, it just checks that the input
 * has the correct structure with the correct sequence of /, ;, = and ,
 * delimiters.
 *
 * Accessing the individual parts may fail later if they turn out to have
 * content that can't be decoded successfully as a string.
 * @description Checks that valid data URI is parsed as expected
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(String uri, String data, String mimeType, Map<String, String> parameters,
    String charset, bool isBase64) {
  UriData uriData = UriData.parse(uri);

  Expect.equals(data, uriData.contentText);
  Expect.equals(mimeType, uriData.mimeType);
  Expect.mapEquals(parameters, uriData.parameters);
  Expect.equals(charset, uriData.charset);
  Expect.equals(isBase64, uriData.isBase64);
}

main() {
  check("data:text/plain;a=b;base64,dataaaa", "dataaaa", "text/plain",
    {"a": "b"}, "US-ASCII", true);
  check("data:;a=b;base64,dataaaa", "dataaaa", "text/plain", {"a": "b"},
      "US-ASCII", true);
  check("data:;a=b;charset=utf-8;base64,dataaaa", "dataaaa", "text/plain",
      {"a": "b", "charset": "utf-8"}, "utf-8", true);
  check("data:image/gif;a=b;charset=utf-8;base64,dataaaa", "dataaaa",
      "image/gif", {"a": "b", "charset": "utf-8"}, "utf-8", true);
  check("data:a/b;a=b,dataaaa", "dataaaa", "a/b", {"a": "b"}, "US-ASCII", false);
  check("data:a/b;a=b,", "", "a/b", {"a": "b"}, "US-ASCII", false);
  check("data:,", "", "text/plain", {}, "US-ASCII", false);

  String data = " Some data % ";
  check("data:a/b;a=b," + Uri.encodeComponent(data), Uri.encodeComponent(data),
      "a/b", {"a": "b"}, "US-ASCII", false);
  check("data:a/b;a=b;base64," + Uri.encodeComponent(data), Uri.encodeComponent(data),
      "a/b", {"a": "b"}, "US-ASCII", true);
}
