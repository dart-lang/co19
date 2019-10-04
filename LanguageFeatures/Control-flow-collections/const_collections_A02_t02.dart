/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An entry element (the base case in maps):
 *
 * It is a compile-time error if the key and value expressions are not constant
 * expressions.
 *
 * As is already the case in Dart, it is a compile-time error if the key is an
 * instance of a class that implements the operator == unless the key is a
 * Boolean, string, an integer, a literal symbol or the result of invoking a
 * constant constructor of class Symbol. It is a compile-time error if the type
 * arguments of a constant map literal include a type parameter.
 *
 * The expansion is the entry formed by the key and value expression values.
 *
 * @description Checks that it is a compile-time error if the key is an
 * instance of a class that implements the operator ==
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
  var v1 = const {if (true) const Duration(seconds: 1): 1};                     //# 01: compile-time error
  var v2 = const <Object, String> {if (1 > 0) const Duration(seconds: 1), "x"}; //# 02: compile-time error
  var v3 = const {if (2 > 0) const C(1, "x"): "c"};                             //# 03: compile-time error
  const v4 = {if (2 > 0) const C(1, "x"): "c"};                                 //# 04: compile-time error
}
