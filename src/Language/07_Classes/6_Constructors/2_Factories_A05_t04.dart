/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if M is not the name of the immediately 
 * enclosing class.
 * @description Checks that a compile-time error is produced if M is a name of an arbitrary accessible class.
 * @compile-error
 * @author iefremov
 * @issue 980
 */

class Z {}

class C {
  C() {}
  factory Z() {}
}

main() {
  try {
    new C();
  } catch(anything) {}
}
