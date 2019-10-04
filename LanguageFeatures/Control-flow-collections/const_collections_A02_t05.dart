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
 * string, an integer, a literal symbol or the result of invoking a constant
 * constructor of class Symbol. It is a compile-time error if the type arguments
 * of a constant map literal include a type parameter.
 *
 * The expansion is the entry formed by the key and value expression values.
 *
 * @description Checks that it is a compile-time error if the type arguments
 * of a constant map literal include a type parameter.
 * @author sgrekhov@unipro.ru
 */
test<T> (T t) {
  var v1 = const <T, String>{ if (1 > 0) t: "1" };  //# 01: compile-time error
  var v2 = const <String, T>{ if (1 > 0) "2": t };  //# 02: compile-time error
  const v3 = <T, String>{ if (1 > 0) t: "1" };      //# 03: compile-time error
  const v4 = <String, T>{ if (1 > 0) "2": t };      //# 04: compile-time error

}

main() {
  test<String>("s");
}
