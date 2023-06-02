// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If e is an expression whose static type V is the inline type
/// Inline<T1, .. Ts> and m is the name of a member that V has, a member access
/// like e.m(args) is treated as an invocation of the inline member m on the
/// receiver e according to the inline type Inline and with the actual type
/// arguments T1, ..., Ts, with the actual argument part args.
///
/// @description Checks that a member access `e.m(args)` is treated as an
/// invocation of the inline member m on the receiver `e` according to the
/// inline type `Inline` and with the actual type arguments `T1, ..., Ts`, with
/// the actual argument part `args`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class V1<T> {
  final T id;
  V1(this.id);

  (Map<K, V>, T) asMap<K, V>() => (<K, V>{}, id);
}

main() {
  V1<num> v1 = V1(42);
  v1.asMap<String, bool>()
      .expectStaticType<Exactly<(Map<String, bool>, num)>>();

  V1<String> v2 = V1("42");
  v2.asMap<String, String>()
      .expectStaticType<Exactly<(Map<String, String>, String)>>();
}
