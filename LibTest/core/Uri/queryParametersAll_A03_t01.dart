/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, List<String>> queryParametersAll
 * ...
 * Keys are mapped to lists of their values. If a key occurs only once, its
 * value is a singleton list.
 * @description Checks that if a key occurs only once, its value is a singleton
 * list
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var q = 'a=b&c=d&e=f+';
  Map map = {'a': ['b'], 'c': ['d'], 'e': ['f ']};
  Expect.mapEquals(map, new Uri.http('host', 'path', map).queryParametersAll);
  Expect.mapEquals(map, new Uri(query: q).queryParametersAll);
  Expect.mapEquals(map, Uri.parse('http://host/path?$q').queryParametersAll);
}
