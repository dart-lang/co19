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
  var v1 = const {1, 2, 3, null};
  Expect.iterableEquals({1, 2, 3, null}, v1);

  var v2 = const <int> {1, 2, 3};
  Expect.iterableEquals({1, 2, 3}, v2);

  var v3 = const <int> {};
  Expect.iterableEquals({}, v3);

  const v4 = <int> {1, 2, 3, };
  Expect.iterableEquals({1, 2, 3}, v4);

  var v5 = const {'1', '2', '3', '4', null};
  Expect.iterableEquals({'1', '2', '3', '4', null}, v5);

  var v6 = const <String> {'1', '2', '3', '4'};
  Expect.iterableEquals({'1', '2', '3', '4'}, v6);

  var v7 = const <String> {};
  Expect.iterableEquals({}, v7);

  const v8 = <String> {'1', '2', '3', '4',};
  Expect.iterableEquals({'1', '2', '3', '4'}, v8);

  var v9 = const {const Symbol('foo'), const Symbol('bar'), null};
  Expect.iterableEquals({const Symbol('foo'), const Symbol('bar'), null}, v9);

  var v10 = const <Symbol>{const Symbol('foo'), const Symbol('bar')};
  Expect.iterableEquals({const Symbol('foo'), const Symbol('bar')}, v10);

  var v11 = const <Symbol> {};
  Expect.iterableEquals({}, v11);

  const v12 =  <Symbol>{const Symbol('foo'), const Symbol('bar'), };
  Expect.iterableEquals({const Symbol('foo'), const Symbol('bar')}, v12);

  var v13 = const {#==, #foo, #C};
  Expect.iterableEquals({#==, #foo, #C}, v13);

  var v14 = const <Symbol>{#==, #foo, #C};
  Expect.iterableEquals({#==, #foo, #C}, v14);

  const v15 = <Symbol>{#==, #foo, #C,};
  Expect.iterableEquals({#==, #foo, #C}, v15);

  var v16 = const {int, num, String,};
  Expect.iterableEquals({int, num, String}, v16);

  var v17 = const <Type>{int, num, String, null};
  Expect.iterableEquals({int, num, String, null}, v17);

  const v18 = {int, num, String};
  Expect.iterableEquals({int, num, String}, v18);
}
