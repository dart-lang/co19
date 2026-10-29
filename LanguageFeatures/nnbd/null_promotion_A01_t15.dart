// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form `e == null` or of the form `e is Null` where
/// `e` has static type `T` promotes the type of `e` to `Null` in the `true`
/// continuation, and to `NonNull(T)` in the `false` continuation.
///
/// @description Check that a check of the form `e == null` promotes `e` to
/// `X & NonNull(T)` in the `false` continuation if the static type of `e` is
/// `X & T`.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

void test1<X>(X x) {
  if (x is int?) {
    // NonNull(X & int?) == X & NonNull(int?) == X & int
    if (x == null) {
    } else {
      if (2 > 1) {
        x.expectStaticType<Exactly<X>>();
      }
      x.isEven;
    }
  }
}

void test2<X extends Object?>(X x) {
  if (x is num?) {
    // NonNull(X & num?) == X & NonNull(num?) == X & num
    if (x == null) {
    } else {
      if (2 > 1) {
        // ignore: unused_local_variable
        X y = x;
      }
      if (2 > 1) {
        // ignore: unused_local_variable
        num n = x;
      }
      x.isNegative;
    }
  }
}

main() {
  test1<int>(1);
  test1<int?>(1);
  test1<Object?>(1);
  test2<int>(1);
  test2<num?>(1);
}
