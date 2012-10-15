/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if M is not the name of the immediately 
 * enclosing class.
 * @description Checks that it is a compile error when M is an unknown identifier.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 * @issue 980
 */

class C {
  C() {}
  factory A() {}
}

main() {
  try{
    new C();
  } catch(x) {}
}
