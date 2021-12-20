// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The upwards inference key type of an if map element without an
/// else is the key type of the "then" element, likewise for the value type
///
/// @description Checks that the upwards inference key type of an if map element
/// without an else is the key type of the "then" element, likewise for the value
/// type
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var i = 1;
  var x = {1: "Let", 2: "it", 3: "be"} as Map<int, String>?;
  var map1 = {
    if (i > 0) ...?x,
  };
  Expect.isTrue(map1 is Map<int, String>);
  checkType(checkIs<Map<int, String>>, true, map1);

  var map2 = {
    "": "",
    if (i < 0) ...?x,
  };
  Expect.isTrue(map2 is Map<Object, String>);
  Expect.isFalse(map2 is Map<String, String>);
  Expect.isFalse(map2 is Map<num, String>);
  checkType(checkIs<Map<Object, String>>, true, map2);
  checkType(checkIs<Map<String, String>>, false, map2);
  checkType(checkIs<Map<num, String>>, false, map2);
}
