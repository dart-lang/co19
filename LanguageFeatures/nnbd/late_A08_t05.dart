/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A toplevel or static variable with an initializer is evaluated as
 * if it was marked late. Note that this is a change from pre-NNBD semantics in
 * that:
 *  - Throwing an exception during initializer evaluation no longer sets the
 *    variable to null
 *  - Reading the variable during initializer evaluation is no longer checked
 *    for, and does not cause an error.
 *
 * @description Check that reading the variable during initializer evaluation is
 * no longer checked for, and does not cause an error.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class C {
  static String s = ((s = "Lily") == s ? "was" : "here");
}

String g2 = ((g = "Lily") == g ? "was" : "here");

main() {
  Expect.equals("was", C.s);
  Expect.equals("was", g);
}
