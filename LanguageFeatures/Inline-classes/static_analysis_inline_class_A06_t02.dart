// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if await e occurs, and the static type
/// of e is an extension type which is not a subtype of Future<T> for any T.
///
/// @description Checks that it is not an error if `await e` occurs and the
/// static type of `e` is an extension type which is a subtype of `Future<T>`
/// for some `T`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

Future<int> f = Future<int>.value(0);

extension type V1(Future<int> id) {}

extension type V2<T extends Future<Object>>(T id) {}

main() async {
  V1 v1 = V1(Future<int>.value(42));
  var _v1 = await v1;
  Expect.equals(42, _v1);

  V2<Future<String>> v2 = V2(Future<String>.value("42"));
  var _v2 = await v2;
  Expect.equals("42", _v2);
}
