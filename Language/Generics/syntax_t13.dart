/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, or type alias G may be generic, this is,
 * G may have formal type parametera declared.
 * . . .
 * typeParameter:
 *   metadata identifier (extends type)?
 * ;
 * typeParameters:
 *   '<' typeParameter (',' typeParameter)* '>'
 * ;
 * @description Checks that a compile-time error is produced when typeParameter
 * declaration is not complete.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class A<T
class C<T extends Function>{}

main() {
  new C();}
