/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, String> splitQueryString(String query,
 * {decode: null})
 * If the query is the empty string an empty map is returned.
 * Keys in the query string that have no value are mapped to the empty string.
 * @description Check cases with empty query and no value
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

main() {
  var m = Uri.splitQueryString('');
  Expect.equals(m.length, 0);
  m = Uri.splitQueryString('foo&bar=1');
  Expect.equals(2, m.length);
  Expect.equals('', m['foo']);
  Expect.equals('1', m['bar']);
}