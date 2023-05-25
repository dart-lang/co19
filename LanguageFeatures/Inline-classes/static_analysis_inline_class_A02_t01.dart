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
/// It is then allowed to use V<T1, .. Ts> as a type.
///
/// @description Checks that `V<T1, .. Ts>` can be used as a type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V<X1 extends num, X2 extends Object> {
  final X1 id;
  V(this.id);

  X2 foo() => id as X2;
}

V<int, int> foo(V<int, int> v) => v;

class C<T extends V<num, Object>> {
  V<int, int> bar<T extends V<num, num>>(T t) => t as V<int, int>;
}

main() {
  V v1 = V(42);
  Expect.isTrue(v1 is V<num, Object>);

  V<int, int> v2 = V(42);
  Expect.isTrue(v2 is V<int, int>);

  V<int, Never> v3 = V(42);
  Expect.isTrue(v3 is V<int, Never>);

  List<V> l1 = List.empty();
  Expect.isTrue(l1 is List<V<num, Object>>);

  List<V<num, double>> l2 = List.empty();
  Expect.isTrue(l2 is List<V<num, double>>);

  foo(v2);
  C<V<int, int>>().bar<V<int, int>>(v2);
}
