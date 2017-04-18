/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, List<String>> queryParametersAll
 *
 * Returns the URI query split into a map according to the rules specified for
 * FORM post in the HTML 4.01 specification section 17.13.4. Each key and value
 * in the returned map has been decoded. If there is no query the empty map is
 * returned.
 *
 * Keys are mapped to lists of their values. If a key occurs only once, its
 * value is a singleton list. If a key occurs with no value, the empty string is
 * used as the value for that occurrence.
 *
 * The returned map and the lists it contains are unmodifiable.
 * @description Checks that this property returns proper map
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var q = 'a=b&a=c&a=d';
  Map map = {'a': ['b', 'c', 'd']};
  Expect.mapEquals(map, new Uri.http('host', 'path', map).queryParametersAll);
  Expect.mapEquals(map, new Uri(query: q).queryParametersAll);
  Expect.mapEquals(map, Uri.parse('http://host/path?$q').queryParametersAll);
}
