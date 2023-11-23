// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts.
/// ...
/// V has an extension type member m with a uniquely determined declaration Dm
/// ...
/// If Dm is a method with function type F, and args exists, the static analysis
/// of the extension type member invocation is the same as that of an invocation
/// with argument part args of a function with the given type.
///
/// @description Checks static type of an extension type  method invocation
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/static_type_helper.dart';

extension type ET1(int id) {
  int foo<T1, T2 extends num>() => 42;
}

extension type ET2<T extends num>(T id) {
  T foo<T1, T2 extends T>() => id;
}

extension type ET3<T>(T id) {
  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

main() {
  ET1 et1 = ET1(42);
  et1.foo<String, double>().expectStaticType<Exactly<int>>();

  ET2<num> et2_1 = ET2<double>(3.14);
  et2_1.foo<String, double>().expectStaticType<Exactly<num>>();

  ET2<double> et2_2 = ET2(3.14);
  et2_2.foo<String, double>().expectStaticType<Exactly<double>>();

  ET3<num> et3 = ET3(0);
  et3.asMap<String, int>("k1")
      .expectStaticType<Exactly<Map<String, int>>>();

  ET3<num> et3_2 = ET3(3.14);
  et3_2.asMap<String, double>("k1")
      .expectStaticType<Exactly<Map<String, double>>>();
}
