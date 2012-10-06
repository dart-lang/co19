/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * It is a static warning if M.id is not a constructor name.
 * @description Checks that a static warning is produced when an nonexistent factory
 * constructor name is used.
 * @static-warning
 * @author kaigorodov
 */

class C {
  C() {}
}

main() {
  try {
    new C.nonExistent();
  } catch (e) {}
}
