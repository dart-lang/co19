// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is incompatible with await if at least one
/// of the following criteria holds:
/// - T is an extension type that does not implement Future.
/// - T is S?, and S is incompatible with await.
/// - T is X & B, and either:
/// - B is incompatible with await, or
/// - B does not derive a future type, and X is incompatible with await.
/// - T is a type variable with bound S, and S is incompatible with await.
/// Consider an expression of the form await e. A compile-time error occurs if
/// the static type of e is incompatible with await.
///
/// @description Checks that it is a compile-time error if `await e` occurs, and
/// the static type of `e` is `X & B` and `B` does not derive a future type, and
/// `X` is incompatible with await.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type IntET(int i) {}
extension type ET(Future<int> id) {}

main() async {
  ET et = ET(Future<int>.value(2));
  if (et is IntET) {
    await et;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (et is IntET?) {
    await et;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
