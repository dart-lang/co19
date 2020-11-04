/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile time error if the expression is not one of the
 * following:
 *   • A reference to a compile-time constant variable.
 *   • A call to a constant constructor.
 * @description Check that function used as metadata cause a compile time error
 * @author a.semenov@unipro.ru
 */
import 'dart:mirrors';
//     ^
// [web] Not found: 'dart:mirrors'

void metadata() {
}

@metadata()
// [error line 21, column 1, length 11]
// [analyzer] COMPILE_TIME_ERROR.INVALID_ANNOTATION
// [error line 21, column 2]
// [cfe] Method not found: 'metadata'.
class A {}

main() {
  // have to retrieve metadata to get the compile error
 reflectClass(A).metadata.map( (e) => e.reflectee ).join(' ');
// [error line 30, column 2]
// [web] Method not found: 'reflectClass'.
}
