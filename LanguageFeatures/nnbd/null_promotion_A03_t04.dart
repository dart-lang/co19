// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an expression `e!` is `NonNull(T)` where `T`
/// is the static type of `e`.
///
/// @description Check that the static type of an expression `e!` is `dynamic`
/// if the static type of `e` is `dynamic`, and is `Never` if the static type of
/// `e` is `Null`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

dynamic init(dynamic x) => x;

main() {
  dynamic d = init(1);
  if (1 > 2) {
    d!.checkDynamic;
    var proofNotNever = d!;
    proofNotNever = 1; // Error if `proofNotNever` is `Never`
  }

  Null n = init(null);
  if (1 > 2) {
    // `n!` is `Never`, so it is assignable to any type.
    if (2 > 1) { // to avoid promotion after the first `x!`
      // ignore: unused_local_variable, null_check_always_fails
      int i = n!;
    }
    if (2 > 1) { // Check that `n!` is not `dynamic`
      // ignore: null_check_always_fails
      [n!].expectStaticType<Exactly<List<Never>>>();
    }
    // ignore: unused_local_variable, null_check_always_fails
    String s = n!;
  }
}
