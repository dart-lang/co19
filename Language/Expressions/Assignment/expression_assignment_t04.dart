// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
/// follows:
/// The expression e1 is evaluated to an object o1. Then, the expression e2 is
/// evaluated to an object o2. Then, the setter v = is looked up in o1 with
/// respect to the current library. If o1 is an instance of Type but e1 is not a
/// constant type literal, then if v = is a setter that forwards to a static
/// setter, setter lookup fails. Otherwise, the body of v = is executed with its
/// formal parameter bound to o2 and this bound to o1.
/// @description Checks that if evaluation of e1 successful then e2 is evaluated
/// even if setter lookup failed
/// @author sgrekhov@unipro.ru


import '../../../Utils/expect.dart';

class C {
  C operator +(C val) {
    return new C();
  }
}

int count = 0;
int e2() => count++;

main() {
  dynamic c1 = new C();
  dynamic c2 = new C();
  Expect.throws(() {(c1 + c2).v = e2();}, (e) => e is NoSuchMethodError);
  Expect.equals(1, count);
}
