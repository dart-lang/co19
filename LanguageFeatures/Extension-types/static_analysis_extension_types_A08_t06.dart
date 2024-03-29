// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is incompatible with await if at least one
/// of the following criteria holds:
/// - T is an extension type that does not implement Future.
/// - T is S?, and S is incompatible with await.
/// - T is X & B, and B is incompatible with await.
/// - T is a type variable with bound S, and S is incompatible with await.
/// Consider an expression of the form await e. A compile-time error occurs if
/// the static type of e is incompatible with await.
///
/// @description Checks that it is a compile-time error if `await e` occurs, and
/// the static type of `e` is `X & B`, and `B` is incompatible with await.
/// @author sgrekhov22@gmail.com
/// @issue 54648, 54649

import 'dart:async';

extension type NumET(num _) implements num {}
extension type IntET(int _) implements NumET {}

test1<X extends FutureOr<NumET>>(X x) async {
  if (x is IntET) {
    await x;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2<X extends FutureOr<num>>(X x) async {
  if (x is IntET) {
    await x;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test1);
  print(test2);
}
