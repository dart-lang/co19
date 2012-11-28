/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M.id is not a constructor name.
 * It is a compile-time error if M is not the name of the immediately enclosing class.
 * @description Checks that it's both a compile-time error and a static warning 
 * when M is a name of an unrelated class available in the same scope.
 * @compile-error
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
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
