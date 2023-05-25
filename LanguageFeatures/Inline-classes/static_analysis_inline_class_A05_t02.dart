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

 class V<X extends List<Y>, Y extends num> {
  final Y id;
  V(this.id);
}

main() {
  List<V> l = [];
  l.expectStaticType<Exactly<List<V<List<num>, num>>>>();
}
