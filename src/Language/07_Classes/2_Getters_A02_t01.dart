/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If no return type is specified, the return type of the getter is Dynamic.
 * @description Checks that no static warnings are produced when trying to access various
 * non-existent members and properties of value returned by the tested getter. It means
 * that the return type of the getter is Dynamic.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C {
  get foo() {}
}

main() {
  C c = new C();
  try {
    c.foo.abyr = null;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}

  try {
    c.foo.abyr(1, 2, 3);
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}

  try {
    c.foo.abyrvalg = null;
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
}
