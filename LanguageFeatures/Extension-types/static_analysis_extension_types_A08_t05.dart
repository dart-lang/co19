// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that it is not an error if `await e` occurs and the
/// static type of `e` is `S?`, and `S` is compatible with await.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V1(Future<int> _) implements Future<int> {}

extension type V2<T extends Future<Object>>(T _) implements Future<Object>{}

main() async {
  V1? v1 = V1(Future<int>.value(42));
  var _v1 = await v1;
  Expect.equals(42, _v1);

  V2<Future<String>>? v2 = V2(Future<String>.value("42"));
  var _v2 = await v2;
  Expect.equals("42", _v2);
}
