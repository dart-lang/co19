/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the is-expression e is T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the
 * is-expression evaluates to true.
 * Otherwise it evaluates to false.
 * @description Checks that if T is parameterized type with malformed type
 * argument and G is generic type, then T is not malformed (see Types/Parameterized Types).
 * @static-warning
 * @author ilya
 */
import "../../Utils/expect.dart";

class G<T> {}

main() {
  // Unknown is dynamic, G<Unknown> is G<dynamic>, not malformed

  Expect.isFalse(1 is G<Unknown>);      /// static type warning
  Expect.isTrue(new G() is G<Unknown>); /// static type warning
}
