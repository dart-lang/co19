/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a typedef refers to itself via a chain of references
 * that does not include a class or interface type.
 * @description Checks that self-referencing typedef is not allowed (optional formal parameter
 * type annotation has the same name as a type alias).
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

typedef f([f x]);

main() {
  try {
    var func = _([f x]){};
  } catch(x) {}
}
