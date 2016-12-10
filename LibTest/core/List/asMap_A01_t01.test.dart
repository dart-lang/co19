/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion   abstract Map<int, E> asMap()
 * Returns an unmodifiable Map view of this.
 * The map uses the indices of this list as keys and the corresponding objects
 * as values.
 * @description Checks that the method returns Map.
 * Checks that the returned Map is unmodifiable.
 * Checks that the returned Map has the indices of this list as keys.
 * Checks that the returned Map has the corresponding objects as values.
 * @author kaigorodov
 */
library asMap_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(List a0) {
    List a = create(a0.length);
    Expect.equals(a0.length, a.length);
    a.setRange(0, a0.length, a0);
    dynamic map = a.asMap();
    Expect.isTrue(map is Map);

    Expect.throws(() {map["key"] = "value";},(e) => true,
        "Modification did not fail");
    Expect.equals(a.length, map.length);
 
    int count = 0;
    map.forEach((key, value){
       Expect.equals(a[key], map[key]);
       count++;
    });
    Expect.equals(a.length, count);
  
    for (int key = 0; key < a.length; key++) {
      Expect.isTrue(map.containsKey(key));
      Expect.equals(a[key], map[key]);
    }
  }

  List a = new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
  a.add("1");
  check(a);
  a.clear();
  check(a);
}
