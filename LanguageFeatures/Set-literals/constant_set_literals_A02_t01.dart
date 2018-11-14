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
 *
 * @description Checks that it is no compile-time error if all values of the
 * constant element expressions are instances of int or String, objects
 * implementing Symbol originally created by a symbol literal or a constant
 * invocation of the Symbol constructor, or objects implementing Type originally
 * created by a constant type literal expression
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class C {}

main() {
  var v1 = const {1, 2, 3};
  Expect.setEquals({1, 2, 3}, v1);

  var v2 = const <int> {1, 2, 3};
  Expect.setEquals({1, 2, 3}, v2);

  var v3 = const <int> {};
  Expect.setEquals({}, v3);

  var v4 = const {'1', '2', '3', '4'};
  Expect.setEquals({'1', '2', '3', '4'}, v4);

  var v5 = const <String> {'1', '2', '3', '4'};
  Expect.setEquals({'1', '2', '3', '4'}, v5);

  var v6 = const <String> {};
  Expect.setEquals({}, v6);

  var v7 = const {const Symbol('foo'), const Symbol('bar')};
  Expect.setEquals({const Symbol('foo'), const Symbol('bar')}, v7);

  var v8 = const <Symbol>{const Symbol('foo'), const Symbol('bar')};
  Expect.setEquals({const Symbol('foo'), const Symbol('bar')}, v8);

  var v9 = const <Symbol> {};
  Expect.setEquals({}, v9);

  var v10 = const {#==, #foo, #C};
  Expect.setEquals({#==, #foo, #C}, v10);

  var v11 = const <Symbol>{#==, #foo, #C};
  Expect.setEquals({#==, #foo, #C}, v11);

}
