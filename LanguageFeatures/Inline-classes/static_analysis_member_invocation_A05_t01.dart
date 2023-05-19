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

inline class IC3<T> {
  final T id;
  IC3(this.id);

  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

main() {
  IC1 ic1 = IC1(42);
  ic1.foo<String, double>.expectStaticType<Exactly<int Function()>>();

  IC2<num> ic2_1 = IC2<double>(3.14);
  ic2_1.foo<String, double>.expectStaticType<Exactly<num Function()>>();

  IC2<double> ic2_2 = IC2(3.14);
  ic2_2.foo<String, double>.expectStaticType<Exactly<double Function()>>();

  IC3<num> ic3 = IC3(0);
  ic3.asMap<String, double>
      .expectStaticType<Exactly<Map<String, double> Function(String)>>();
  ic3.asMap<String, int>
      .expectStaticType<Exactly<Map<String, int> Function(String)>>();
}
