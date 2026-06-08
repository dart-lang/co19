// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The execution of a return statement proceeds as follows.
///
/// Case ⟨Synchronous non-generator functions and factory constructors⟩. Let `s`
/// be a statement of the form `return e;`. Let `f` be the immediately enclosing
/// function, and consider the case where `f` is a synchronous non-generator or
/// a factory constructor. Execution of `s` proceeds as follows.
///
/// The expression `e` is evaluated to an object `o`. A dynamic error occurs
/// unless the dynamic type of `o` is a subtype of the actual return type of `f`.
/// Then the return statement `s` completes returning `o`.
///
/// @description Checks that no error occurs if the run-time type of `e` is a
/// subtype of the actual return type of `f`.
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../../Utils/expect.dart';

num f1() {
  return 1 as dynamic;
}

num f2() {
  return 3.14 as dynamic;
}

num? f3() {
  return null as dynamic;
}

FutureOr<num> f4() {
  return 4;
}

FutureOr<num> f5() {
  return Future<num>.value(5);
}

int f6(v) {
  return v;
}

main() async {
  Expect.equals(1, f1());
  Expect.equals(3.14, f2());
  Expect.isNull(f3());
  Expect.equals(4, f4());
  Expect.equals(5, await f5());
  Expect.equals(6, f6(6 as num));
}
