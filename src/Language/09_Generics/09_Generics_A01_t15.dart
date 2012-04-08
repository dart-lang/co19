/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class (7), interface (8) or type alias may be generic.
 * typeParameter: identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that a compile-time error is produced when "extends" keyword
 * is not spelled correctly and is not followed with "type".
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class C<T extend >{}

main() {
  try {
    new C();
  }catch(var x){}
}