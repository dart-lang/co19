/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string
 * literals, such that these expressions are evaluated, and the resulting
 * values are converted into strings and concatenated with the enclosing
 * string. This process is known as string interpolation.
 * stringInterpolation:
 *   '$' IDENTIFIER_NO_DOLLAR |
 *   '$' '{' expression '}'
 * ;
 * @description Checks that there is no compile-time error if the identifier in
 * a string interpolation construct is the name of type parameter (see
 * Identifier Reference).
 * @author msyabro
 * @reviewer rodionov
 */

class C<T> {
  test() {
    try {
      "$T";
    } on NoSuchMethodError catch (ok) {
      // may or may not implement toString()
      print (ok);
    }
  }
}

main() {
  new C<int>().test();
}
