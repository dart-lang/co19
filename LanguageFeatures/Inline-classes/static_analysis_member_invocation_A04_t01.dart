// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If Dm is a method with function type F, and args is omitted, the
/// invocation has static type [T1/X1 .. Ts/Xs]F.
///
/// @description Checks static type of a method tear-off with omitted type
/// arguments of an `inline` class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class IC1 {
  final int id;
  IC1(this.id);

  int foo<T1, T2 extends num>() => 42;
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);

  T foo<T1, T2 extends T>() => id;
}

main() {
  IC1 ic1 = IC1(42);
  ic1.foo.expectStaticType<Exactly<int Function<T1, T2 extends num>()>>();

  IC2<num> ic2 = IC2<double>(3.14);
  ic2.foo.expectStaticType<Exactly<num Function<T1, T2 extends num>()>>();

  IC2<double> ic3 = IC2(3.14);
  ic3.foo.expectStaticType<Exactly<double Function<T1, T2 extends double>()>>();
}
