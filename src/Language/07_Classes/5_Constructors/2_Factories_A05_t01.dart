/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M is not the name of the immediately
 * enclosing class or the name of an interface in the enclosing lexical scope.
 * @description Checks that it is a static warning when M is an unknown identifier.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

class C {
  C() {}
  factory A() {}
}

main() {
  try{
    new C();
  } catch(var x){}
}
