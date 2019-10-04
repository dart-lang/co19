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
 * @description Checks that it is a compile-time error if any of the values of
 * the constant element expressions override Object.operator==
 * @author sgrekhov@unipro.ru
 */
class C {
  final int id;
  final String name;
  const C(this.id, this.name);
  int get hashCode => id;
  bool operator==(Object other) => other is C && id == other.id;
  String toString() => "C($id, $name)";
}

main() {
  var v1 = const {1, '2', const Duration(seconds: 1)};          //# 01: compile-time error
  var v2 = const <Object> {1, '2', const Duration(seconds: 1)}; //# 02: compile-time error
  var v3 = const {1, '2', const C(1, "x")};                     //# 03: compile-time error
  var v4 = const {1, '2', const C(1, "x")};                     //# 04: compile-time error
}
