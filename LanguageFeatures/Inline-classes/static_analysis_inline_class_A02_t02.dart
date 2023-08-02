// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an extension
/// type declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type. A compile-time error
/// occurs if the type V<T1, .. Tk> provides a wrong number of type arguments to
/// V (when k is different from s), and if it is not regular-bounded.
///
/// @description Checks that an inline type `V<T1, .. Ts>` can be used in a
/// function types and type aliases
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V<X1 extends num, X2 extends Object>(X1 id) {}

typedef V<int, int> Foo<T extends V<num, Object>>(V<int, int> v);
typedef IntNumV = V<int, num>;

V<int, int> foo<T extends V<num, Object>>(T t) => t as V<int, int>;

class C<T extends V<num, Object>> {
   Foo<T> f = foo<V<int, int>>;
}

main() {
  IntNumV v = IntNumV(42);
  Expect.equals(42, v.id);

  Expect.equals(v, foo(v));
  Expect.equals(V<int, int>(0), C<V<int, int>>().f(V<int, int>(0)));
  Expect.equals(V(1), C<V<int, int>>().f(V<int, int>(1)));
}
