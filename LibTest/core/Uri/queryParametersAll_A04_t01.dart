/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<String, List<String>> queryParametersAll
 * ...
 * If a key occurs with no value, the empty string is used as the value for that
 * occurrence.
 * @description Checks that if a key occurs with no value, the empty string is
 * used as the value for that occurrence
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var q = 'a=b&c&e&f=+';
  Map map = {'a': ['b'], 'c': [''], 'e': [''], 'f': [' ']};
  Expect.mapEquals(map, new Uri.http('host', 'path', map).queryParametersAll);
  Expect.mapEquals(map, new Uri(query: q).queryParametersAll);
  Expect.mapEquals(map, Uri.parse('http://host/path?$q').queryParametersAll);
}
