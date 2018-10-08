/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> splitQueryString(String query, {
 *  Encoding encoding: utf8
 *  })
 * Returns the query split into a map according to the rules specified for FORM
 * post in the HTML 4.01 specification section 17.13.4. Each key and value in
 * the returned map has been decoded. If the query is the empty string an empty
 * map is returned.
 *
 * Keys in the query string that have no value are mapped to the empty string.
 *
 * Each query component will be decoded using encoding. The default encoding is
 * UTF-8.
 * @description Checks cases of encoded and not encoded keys and values
 * @author ilya
 */
import "../../../Utils/expect.dart";

enc(x) => Uri.encodeComponent(x);

main() {
  // basic case
  var m = Uri.splitQueryString('foo=1&bar=2');
  Expect.mapEquals({'foo': '1', 'bar':'2'}, m);

  // trailing ampersand
  m = Uri.splitQueryString('foo=1&bar=2&');
  Expect.mapEquals({'foo': '1', 'bar':'2'}, m);

  // + is encoded space
  m = Uri.splitQueryString('foo=1&bar=2+3');
  Expect.mapEquals({'foo': '1', 'bar':'2 3'}, m);

  // %2B is encoded +
  m = Uri.splitQueryString('foo=1&bar=2%2B3');
  Expect.mapEquals({'foo': '1', 'bar':'2+3'}, m);

  // basic and extended unicode in vars and values
  m = Uri.splitQueryString('${enc("a \u0000")}=${enc("a \u{10000}")}&'
                           '${enc("a \u0001")}=${enc("a \u{10001}")}');
  Expect.mapEquals({"a \u0000": "a \u{10000}", "a \u0001": "a \u{10001}"}, m);
}
