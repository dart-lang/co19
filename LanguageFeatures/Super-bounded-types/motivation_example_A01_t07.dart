// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Here are some examples of finite unfoldings, and the effect they
/// have on types of expressions:
///
/// class C<X extends C<X>> {
///   X next;
///   C(this.next);
/// }
///
///  class D extends C<D> {
///    D(D next): super(next);
///  }
///
/// main() {
///   D d = new D(new D(null));
///   C<dynamic> c0 = d;
///   C<C<dynamic>> c1 = d;
///   C<C<C<dynamic>>> c2 = d;
///
///   c0.next.unknown(42); // Statically OK, `c0.next` is `dynamic`.
///   c1.next.unknown(43); // Compile-time error.
///   c1.next.next.unknown(44); // Statically OK.
///   c2.next.next.unknown(45); // Compile-time error.
///   c2.next.next.next.unknown(46); // Statically OK.
///
///   // With type `D`, the static analysis is aware of the cyclic
///   // structure of the type, and every level of nesting is handled
///   // safely. But `D` may be less useful because there may be a
///   // similar type `D2`, and this code will only work with `D`.
///   d.next.next.next.next.next.next.next.unknown(46); // Compile-time error.
/// }
///
/// @description Checks that [(d as dynamic).next.unknown(43)] line throws a
/// error in runtime.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class C<X extends C<X>> {
  X? next;
  C(this.next);
}

class D extends C<D> {
  D(D? next): super(next);
}

main() {
  dynamic d = D(D(null));
  Expect.throws(() { d.next.unknown(43); }, (e) => e is NoSuchMethodError);
}
