/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap.identity()
 * Creates an unordered identity-based map.
 * Effectively a shorthand for:
 * new HashMap(equals: identical,  hashCode: identityHashCode)
 * @description Checks that created hash map is equivalent of
 * new HashMap(equals: identical,  hashCode: identityHashCode)
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class C {
  int get hashCode => 1;
  operator == (dynamic c) {
    return true;
  }
}

main() {
  HashMap map1 = new HashMap.identity();
  HashMap map2 = new HashMap(equals: identical, hashCode: identityHashCode);
  HashMap map3 = new HashMap();

  C key1 = new C();
  C key2 = new C();
  C key3 = new C();

  map1[key1] = 1;
  map1[key2] = 2;
  map1[key3] = 3;

  map2[key1] = 1;
  map2[key2] = 2;
  map2[key3] = 3;

  map3[key1] = 1;
  map3[key2] = 2;
  map3[key3] = 3;

  Expect.equals(3, map1.length);
  Expect.equals(3, map2.length);
  Expect.equals(1, map3.length);
}
