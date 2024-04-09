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
/// @description Checks invocation of the extension type member `m` with
/// actual type arguments and no argument part
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

extension type ET1<T>(T i) {
  ET1.n(this.i);
  T get m1 => i;
  T m2(T t) => t;
}

extension type ET2<K, V>(K i) {
  Map<K, V?> get asMap => {i: null};
}

main() {
  Expect.equals(0, ET1<int>(0).m1);
  ET1<int>(0).m2.expectStaticType<Exactly<int Function(int)>>();
  ET1<String>.new.expectStaticType<Exactly<ET1<String> Function(String)>>();
  ET1<String>.n.expectStaticType<Exactly<ET1<String> Function(String)>>();

  Expect.mapEquals({"key": null}, ET2<String, int>("key").asMap);
}
