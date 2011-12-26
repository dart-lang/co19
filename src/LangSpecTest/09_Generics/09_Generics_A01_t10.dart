/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class (7), interface (8) or type alias may be generic.
 * typeParameter: identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that a compile-time error is produced when trying
 * to use a type parameter with type parameters as a type parameter bound .
 * @compile-error
 * @author iefremov
 * @needsreview undocumented: issue 955
 */

class C<T extends T<T>>{}

main() {
  try {
    new C();
  }catch(var x){}
}