// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If e is an expression whose static type V is the extension type
/// Name<T1, .. Ts> and m is the name of a member that V has, a member access
/// like e.m(args) is treated as an invocation of the extension type member m on
/// the receiver e according to the extension type declaration Name with the
/// actual type arguments T1, ..., Ts, with the actual argument part args.
///
/// Similarly, e.m is treated an invocation of the extension type member m on
/// the receiver e according to the extension type declaration Name with the
/// actual type arguments T1, ..., Ts and no actual argument part.
///
/// Similarly, e.m<typeArgs> is treated the same, but omits args, and includes
/// <typeArgs>
///
/// @description Checks invocation of the extension type member `m()` with
/// actual type arguments and argument part
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type ET1<T>(T i) {
  T m(T t) => t;
}

extension type ET2<K, V>(K i) {
  Map<K, V> asMap(V v) => {i: v};
}

main() {
  Expect.equals(42, ET1<int>(0).m(42));
  Expect.mapEquals({"key": 42}, ET2<String, int>("key").asMap(42));
}
