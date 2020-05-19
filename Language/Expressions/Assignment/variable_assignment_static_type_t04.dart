/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * ...
 * It is a static type warning if the static type of e may not be assigned to
 * the static type of v. The static type of the expression v = e is the static
 * type of e.
 * @description Checks that static type of v = e is static type of e.
 * @compile-error
 * @author ilya
 */

class C {}
class D {}

main() {
  var x;
  D y = (x = new C());
}
