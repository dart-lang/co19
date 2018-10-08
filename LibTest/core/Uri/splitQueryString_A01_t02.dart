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
 * @description Check cases with empty query and no value
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var m = Uri.splitQueryString('');
  Expect.mapEquals({}, m);
  
  m = Uri.splitQueryString('foo&bar=1');
  Expect.mapEquals({'foo': '', 'bar': '1'}, m);

  m = Uri.splitQueryString('foo&bar=1&x&y');
  Expect.mapEquals({'foo': '', 'bar': '1', 'x': '', 'y': ''}, m);
}
