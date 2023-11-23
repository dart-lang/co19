// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of an equality expression ee of the form super == e
/// proceeds as follows:
/// • The expression e is evaluated to an object o.
/// • If either this or o is null, then ee evaluates to evaluates to true if both
///   this and o are null and to false otherwise. Otherwise ee is equivalent to
///   the method invocation super.==(o).
/// @description Checks that if nnbd is turned on and [o] is [null], the operator
/// super [==(o)] is called and no exception is thrown.
/// @author msyabro
/// @issue https://github.com/dart-lang/co19/issues/871

// Requirements=nnbd-strong
import '../../../Utils/expect.dart';

class S {
  operator ==(other) {
    return false;
  }
}

class C extends S {
  test() {
    dynamic n = null;
    Expect.isFalse(super == n);
  }
}

main() {
  new C().test();
}
