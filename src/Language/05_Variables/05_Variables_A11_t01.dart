/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Local variables cause a getter (and if necessary a setter) to be added to
 * the innermost enclosing scope at the point following the local variable declaration.
 * @description Checks that local variable getters and setters are not accessible
 * before the local variable declaration.
 * @author kaigorodov
 */
 
void test1() {
  var v=w; // getter unavailable
  var w;
}

void test2() {
  v=1; // setter unavailable
  var v;
}

main() {
  Expect.throws(test1, (e) => e is NoSuchMethodError);
  Expect.throws(test2, (e) => e is NoSuchMethodError);
}
