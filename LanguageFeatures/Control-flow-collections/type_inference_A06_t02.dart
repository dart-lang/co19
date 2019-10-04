/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The upwards inference key type of an if map element without an
 * else is the key type of the "then" element, likewise for the value type
 *
 * @description Checks that the upwards inference key type of an if map element
 * without an else is the key type of the "then" element, likewise for the value
 * type
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var i = 1;
  var x = {1: "Let", 2: "it", 3: "be"};
  var map1 = {
    if (i > 0) ...x,
  };
  Expect.isTrue(map1 is Map<int, String>);

  var map2 = {
    "": "",
    if (i < 0) ...?x,
  };
  Expect.isTrue(map2 is Map<Object, String>);
  Expect.isFalse(map2 is Map<String, String>);
  Expect.isFalse(map2 is Map<num, String>);
}
