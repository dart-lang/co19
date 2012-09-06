/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an explicit type is associated with of p2, it is a static warning if that type
 * is not Object or Dynamic. 
 * @description Checks that it's a static warning if there's an explicit type associated
 * with the second argument of a catch clause and it's not Object or Dynamic.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {}

main() {
  try {
    try {
      throw new A();
    } catch(var ex, A trace) {}
  } catch(ok) {} // TypeError?
}
