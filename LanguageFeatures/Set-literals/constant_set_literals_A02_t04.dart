/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the values of the constant
 * element expressions override Object.operator== unless they are instances of
 * int or String, objects implementing Symbol originally created by a symbol
 * literal or a constant invocation of the Symbol constructor, or objects
 * implementing Type originally created by a constant type literal expression.
 * It is a compile-time error if any two of the values are equal according to ==
 *
 * @description Checks that it is a compile-time error if any any two of the
 * values are equal according to ==
 * @author sgrekhov@unipro.ru
 */
main() {
  var v1 = const {1, 2, 1};               //# 01: compile-time error
  const v2 = const {1, 2, 1};             //# 02: compile-time error
  const v3 = {1, 2, 1};                   //# 03: compile-time error
  var v4 = const {1, null, null};         //# 04: compile-time error
  const v5 = const {'a', 'b', 'c', 'a'};  //# 05: compile-time error
  const v5 = {'a', 'b', 'c', 'a'};        //# 06: compile-time error
}
