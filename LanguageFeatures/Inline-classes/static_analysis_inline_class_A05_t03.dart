// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an inline
/// class declaration of the following form:
///
/// inline class V<X1 extends B1, .. Xs extends Bs> ... {
///   final T id;
///   V(this.id);
///
///   ... // Other members.
/// }
/// ...
/// When s is zero, V<T1, .. Ts> simply stands for V, a non-generic inline type.
/// When s is greater than zero, a raw occurrence V is treated like a raw type:
/// Instantiation to bound is used to obtain the omitted type arguments
///
/// @description Checks that instantiation to bound is used to obtain the
/// omitted type arguments
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class V1<T extends num> {
  final int id;
  V1(this.id);
}

inline class V2<T extends Object> {
  final int id;
  V2(this.id);
}

inline class V3<T extends Object?> {
  final int id;
  V3(this.id);
}

main() {
  var v1 = V1(42);
  v1.expectStaticType<Exactly<V1<num>>>();

  var v2 = V2(42);
  v2.expectStaticType<Exactly<V2<Object>>>();

  var v3 = V3(42);
  v3.expectStaticType<Exactly<V3<Object?>>>();
}
