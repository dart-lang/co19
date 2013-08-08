/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a library, static or local variable v is ﬁnal
 * and v is not initialized at its point of declaration.
 * @static-warning
 * @description Checks that it is a static warning when a final static variable is not
 * initialized in its declaration. 
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  static final bool v;
}

main() {
  try {
    print(C.v);
  } catch(ok) {}
}
