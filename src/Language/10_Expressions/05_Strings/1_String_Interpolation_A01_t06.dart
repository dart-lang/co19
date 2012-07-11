/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string literals, such that these
 * expressions are evaluated, and the resulting values are converted into strings and concatenated
 * with the enclosing string. This process is known as string interpolation.
 * STRING_INTERPOLATION:
 *   '$' IDENTIFIER_NO_DOLLAR
 *   | '$' '{' Expression '}'
 * ;
 * @description Checks that using a type variable as the expression in a string interpolation
 * construct results in a compile-time error as specified in Ch. 10.28:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id. It is a compile-time error if d is a class, interface, type alias or type variable.
 * @compile-error 
 * @author msyabro
 * @reviewer rodionov
 */

class C<T> {
  test() {
    try {
      "$T";
    } catch (var ok) {
      print(ok);
    }
  }
}

main() {
  new C().test();
}
