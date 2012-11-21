/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if M.id is not a constructor name.
 * @description Checks that a static warning is produced when factory keyword
 * is followed by a name that is not a constructor name.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  C();
  factory WrongClass() {}
}

main() {
  new C();
}
