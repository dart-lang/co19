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

main() {
  const m1 = <int, String>{1: "val1", 1: "val2"};     //# 01: compile-time error
  var m2 = const <String, int>{"key1": 1, "key1": 2}; //# 02: compile-time error
}
