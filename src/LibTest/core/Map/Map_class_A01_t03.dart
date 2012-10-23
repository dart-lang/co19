/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A [Map] is an associative container, mapping a key to a value.
 * Null values are supported.
 * @description Checks thet the map works correctly with hashcode collisions.
 * @author msyabro
 * @reviewer varlax
 */

class A {
  String s;
  A(this.s) {}
  int get hashCode {
    return s.length;
  }
}


main() {
  Map<A, Object> map = new Map<A, Object>();
  A a1 = new A("aa");
  A a2 = new A("bb");
  
  map[a1] = 1;
  map[a2] = 2;
  Expect.isTrue(map.length == 2);
  Expect.isTrue(map.containsKey(a1));
  Expect.isTrue(map.containsKey(a2));
  Expect.isTrue(!map.containsKey(new A("99")));
}
