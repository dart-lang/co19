/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the is-expression e is T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed or deferred type, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the
 * is-expression evaluates to true.
 * Otherwise it evaluates to false.
 * @description Checks that if the interface of the class v is not a subtype
 * of T, the is-expression evaluates to false.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {}
class B extends A {}

main() {
  Expect.isFalse(new A() is B);
}
