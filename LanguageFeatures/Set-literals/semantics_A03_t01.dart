/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an emptySetOrMapLiteral has a
 * typeArguments with more than two type arguments.
 *
 * @description Checks that it is a compile-time error if an
 * emptySetOrMapLiteral has a typeArguments with more than two type arguments.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=set-literals
var v1 = <int, String, Object> {};        //# 01: compile-time error
var v2 = const <int, String, Object> {};  //# 02: compile-time error

main() {
  var x1 = <int, String, Object> {};        //# 03: compile-time error
  var x2 = const <int, String, Object> {};  //# 04: compile-time error
}
