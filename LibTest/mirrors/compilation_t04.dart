// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile time error if the expression is not one of the
 * following:
 *   • A reference to a compile-time constant variable.
 *   • A call to a constant constructor.
 * @description Check that if static class method is used as metadata, then a
 * compile time error is raised.
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
//     ^
// [web] Not found: 'dart:mirrors'

class A {
  static int a() {
    return 10;
  }
}

@A.a()
// [error line 25, column 1, length 6]
// [analyzer] COMPILE_TIME_ERROR.INVALID_ANNOTATION
// ^
// [cfe] Method not found: 'A.a'.
class B {}

main() {
  // have to retrieve metadata to get compile error
  reflectClass(B).metadata.map( (e) => e.reflectee ).join(' ');
//^
// [web] Method not found: 'reflectClass'.
}
