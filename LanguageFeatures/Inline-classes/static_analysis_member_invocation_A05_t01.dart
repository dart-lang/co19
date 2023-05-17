// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If Dm is a method with function type F, and args exists, the
/// static analysis of the inline member invocation is the same as that of an
/// invocation with argument part args of a function with type [T1/X1 .. Ts/Xs]F
///
/// @description Checks static type of a method tear-off with type arguments
/// specified
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
  ic1.foo<String, double>.expectStaticType<Exactly<int Function()>>();

  IC2 ic2 = IC2<double>(3.14);
  ic2.foo<String, double>.expectStaticType<Exactly<num Function()>>();

  IC2<double> ic3 = IC2<double>(3.14);
  ic3.foo<String, double>.expectStaticType<Exactly<double Function()>>();
}
