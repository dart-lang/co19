/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an interface method m1 overrides an
 * interface member m2 and m1 has a different number of required parameters than m2. 
 * @description Checks that a situation where the overriding interface method has fewer 
 * required parameters than the method being overridden indeed produces a compile-time error.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 970
 */

interface I {
  void m1(int i);
}

interface J extends I {
  void m1();
}

main() {
  J j = null;
  try {j.m1();} catch(e) {}
}

