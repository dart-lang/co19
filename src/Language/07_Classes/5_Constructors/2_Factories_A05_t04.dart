/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M is not the name of the immediately
 * enclosing class.
 * @description Checks that  a static warning is produced if M is a name of an arbitrary class.
 * @static-warning
 * @author iefremov
 */

class Z {}

class C {
  C() {}
  factory Z() {}
}

main() {
  new C();
}
