/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, or type alias G may be generic.
 * typeParameter: metadata identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that closing bracket is a must.
 * @compile-error
 * @author iefremov
 * @reviewer kaigorodov
 */

class C<T{}

main() {
  try {
    new C();
  } catch(x){}
}
