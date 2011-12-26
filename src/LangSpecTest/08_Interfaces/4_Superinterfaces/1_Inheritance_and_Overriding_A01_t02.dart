/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface I inherits any members of its superinterfaces that 
 * are not overridden by members declared in I.
 * @description Checks that an interface inherits static members of its superinterfaces
 * (which can only be final initialized fields, according to grammar).
 * @author vasya
 * @reviewer rodionov
 * @needsreview issue 967
 */

interface S {
  static final int foo = 1;
}

interface I extends S {
}

main() {
  Expect.equals(S.foo, I.foo);
}

