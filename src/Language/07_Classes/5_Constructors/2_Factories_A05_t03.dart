/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if M is not the name of the immediately
 * enclosing class or the name of an interface in the enclosing lexical scope.
 * @description Checks that it is a compile-time error when M is the name of
 * a function type alias.
 * @author rodionov
 * @reviewer iefremov
 * @compile-error
 * @needsreview issue 980
 */

typedef foo();

class C {
  C() {}
  factory foo() {}
}

main() {
  try{
    new C();
  } catch(var x){}
}
