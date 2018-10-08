/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new Uri({scheme, String userInfo: "", String host: "", port: 0,
 * String path, Iterable<String> pathSegments, String query, Map<String,
 * String> queryParameters, fragment: ""})
 * Creates a new URI from its components.
 * The query component is set through either query or
 * queryParameters. When query is used the provided string is expected to be
 * fully percent-encoded and is used in its literal form. When queryParameters
 * is used the query is built from the provided map. Each key and value in the
 * map is percent-encoded and joined using equal and ampersand characters.
 * The percent-encoding of the keys and values encodes all characters except
 * for the unreserved characters.
 * @description Checks query set via [queryParameters] on characters from
 * Unicode Basic Multilingual Plane
 * @author ilya
 * @reviewer
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

String unreserved = "0123456789"
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "-._~";

encodeOctet(int x) =>
  (x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}')
  .toUpperCase();

enc(String s) => s.runes
  .map((x) =>
      unreserved.runes.contains(x)
      ? new String.fromCharCode(x)
      : x == 32
        ? '+'
        : utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

tryRange(start, end) {
  for (var i=start; i<=end; ++i) {
    var s = new String.fromCharCode(i);
    var uri = new Uri(queryParameters: {s:s, 'foo':s});
    Expect.equals('${enc(s)}=${enc(s)}&foo=${enc(s)}', uri.query);
  }
}

main() {
  tryRange(0, 0xD7FF);
  tryRange(0xE000, 0xFFFF);
}
