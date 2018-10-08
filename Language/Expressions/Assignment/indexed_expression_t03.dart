/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent
 * to the evaluation of the expression
 * (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @description Checks that method noSuchMethod is invoked
 * (which results in NoSuchMethodError) if the type of e1 doesn't define an
 * []= operator.
 * @author rodionov
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  operator [](idx) {}
}

main() {
  dynamic c = new C();
  Expect.throws(() {c[0] = 1;}, (e) => e is NoSuchMethodError);
}
