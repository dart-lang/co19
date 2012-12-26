/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M.id is not a constructor name.
 * It is a compile-time error if M is not the name of the immediately enclosing class.
 * @description Checks that it's both a compile-time error and a static warning 
 * when M is the name of a function type alias available in the same scope.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 * @needsreview issue 980, 7602
 */

typedef foo();

class C {
  C() {}
  factory foo() {}
}

main() {
  try{
    new C();
  } catch(x) {}
}
