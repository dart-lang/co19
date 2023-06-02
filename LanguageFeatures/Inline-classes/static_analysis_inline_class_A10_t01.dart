// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, e.m is treated an invocation of the inline member m on
/// the receiver e according to the inline type Inline and with the actual type
/// arguments T1, ..., Ts and no actual argument part.
///
/// @description Checks that a member access `e.m` is treated as an invocation
/// of the inline member `m` on the receiver `e` according to the inline type
/// `Inline` and with the actual type arguments `T1, ..., Ts` and no actual
/// argument part
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class V1<T, K, V> {
  final T id;
  V1(this.id);

  (Map<K, V>, T) get asMap => (<K, V>{}, id);
}

main() {
  V1<num, String, bool> v1 = V1(42);
  v1.asMap.expectStaticType<Exactly<(Map<String, bool>, num)>>();

  V1<String, String, Null> v2 = V1("42");
  v2.asMap.expectStaticType<Exactly<(Map<String, Null>, String)>>();
}
