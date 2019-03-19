/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if two keys of a constant map literal
 * are equal according to their ‘==’ operator
 * @description Check that it is a compile-time error if two keys of a constant
 * map literal are equal according to their ‘==’ operator
 * @issue #32983
 * @author msyabro
 * @author sgrekhov@unipro.ru
 */

class C {
  final a;
  final b;

  const C(this.a, this.b);
  int get hashCode => a;
  bool operator== (other) => this.a == other.a;
}

main() {
  const m1 = <int, String>{1: "val1", 1: "val2"};     //# 01: compile-time error
  var m2 = const <String, int>{"key1": 1, "key1": 2}; //# 02: compile-time error
  const m3 = <C, int>{const C(1, 2): 1, const C(1, 3): 2};      //# 03: compile-time error
  var m4 = const <C, int>{const C(1, 2): 1, const C(1, 3): 2};  //# 04: compile-time error
}
