/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M is not the name of the immediately
 * enclosing class.
 * @description Checks that it is a static type warning when M is the name of
 * a function type alias.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
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
  } catch (x){}
}
