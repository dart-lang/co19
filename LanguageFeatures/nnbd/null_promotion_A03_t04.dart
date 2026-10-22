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

dynamic init(dynamic x) => x;

main() {
  dynamic d = init(1);
  if (1 > 2) {
    d!.checkDynamic;
  }

  Null n = init(null);
  if (1 > 2) {
    // `n!` is `Never`, so it is assignable to any type.
    if (2 > 1) {
      int i = n!;
    }
    String s = n!;
  }
}
