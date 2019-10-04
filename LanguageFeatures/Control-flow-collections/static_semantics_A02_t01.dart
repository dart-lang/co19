/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let the key type and value type of a map literal be the
 * corresponding static types of the type arguments for a map literal.
 * So <int, String>{} and {1: "s"} both have a key type of int and a value type
 * of String
 *
 * @description Checks that element type of the map literals is the static type
 * of the type argument used to create the map
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  bool b = true;
  var collection = [3, 1, 4, 1, 5];

  Map<String, int> map1 = {
    if (b) "1": 1,
    if (!b) "2": 2,
    if (b) for (var v in collection) if (v.isOdd) "$v": v,
    for (int i = 5; i < 10; i++) "$i": i
  };
  Expect.isTrue(map1 is Map<String, int>);

  var map2 = <String, int>{
    if (b) "1": 1,
    if (!b) "2": 2,
    if (b) for (var v in collection) if (v.isOdd) "$v": v,
    for (int i = 5; i < 10; i++) "$i": i
  };
  Expect.isTrue(map2 is Map<String, int>);

  var map3 = {
    if (b) "1": 1.0,
    if (!b) "": 2,
    if (b) for (var v in collection) if (v.isOdd) "$v": v,
    for (int i = 5; i < 10; i++) "$i": i
  };
  Expect.isTrue(map3 is Map<String, num>);
  Expect.isFalse(map3 is Map<String, int>);

  const map4 = {
    if (2 > 1) "1": 1.0,
    if (1 > 2) "2": 2,
    "3": 3,
  };
  Expect.isTrue(map4 is Map<String, num>);
  Expect.isFalse(map4 is Map<String, int>);

  var map5 = const {
    if (2 > 1) 1: "1",
    if (1 > 2) 2: "2",
    3: "3"
  };
  Expect.isTrue(map5 is Map<int, String>);
}
