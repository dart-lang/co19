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
 * @description Checks that it is no compile-time error if the key is a
 * Boolean, string, an integer, a literal symbol or the result of invoking a
 * constant constructor of class Symbol
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = true;
  const bool = true;

  var v1 = const { if (t) "x1": bool };
  Expect.mapEquals({"x1": bool}, v1);

  var v2 = const <String, Duration> { if (1 > 0) "x2": null };
  Expect.mapEquals({"x2": null}, v2);

  var v3 = const <String, dynamic> {if (1 < 0) "x3": false};
  Expect.mapEquals({}, v3);

  const v4 = <String, Duration> {if (t) "x4": const Duration(days: 1) };
  Expect.mapEquals({"x4": const Duration(days: 1)}, v4);

  var v5 = const {if (t) 1: bool };
  Expect.mapEquals({1: bool}, v5);

  var v6 = const <int, Duration> {if (1 > 0) 1: null };
  Expect.mapEquals({1: null}, v6);

  var v7 = const <int, dynamic> {if (1 < 0) 1: false};
  Expect.mapEquals({}, v7);

  const v8 = <int, Duration> {if (t) 1: const Duration(days: 1) };
  Expect.mapEquals({1: const Duration(days: 1)}, v8);

  var v9 = const {if (t) '1': true};
  Expect.mapEquals({'1': true}, v9);

  var v10 = const <String, int> {if (t) '1': 1};
  Expect.mapEquals({'1': 1}, v10);

  var v11 = const <String, int> {if (1 < 0) '1': 1};
  Expect.mapEquals({}, v11);

  const v12 = <String, dynamic> {if (t) '1': true};
  Expect.mapEquals({'1': true}, v12);

  var v13 = const {if (t) const Symbol('foo'): null};
  Expect.mapEquals({const Symbol('foo'): null}, v13);

  var v14 = const <Symbol, Symbol>{if (t) const Symbol('foo'): const Symbol('bar')};
  Expect.mapEquals({const Symbol('foo'): const Symbol('bar')}, v14);

  var v15 = const <Symbol, dynamic> {if (1 < 0) const Symbol('foo'): bool};
  Expect.mapEquals({}, v15);

  const v16 = <Symbol, String>{if (t) const Symbol('foo'): "", };
  Expect.mapEquals({const Symbol('foo'): ""}, v16);

  var v17 = const { if (t) bool: bool };
  Expect.mapEquals({bool: bool}, v17);

  var v18 = const { if (1 > 0) bool: null };
  Expect.mapEquals({bool: null}, v18);

  var v19 = const {if (1 < 0) bool: false};
  Expect.mapEquals({}, v19);

  const v20 = {if (t) bool: const Duration(days: 1) };
  Expect.mapEquals({bool: const Duration(days: 1)}, v20);
}
