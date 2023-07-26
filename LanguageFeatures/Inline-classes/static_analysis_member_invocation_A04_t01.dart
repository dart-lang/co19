// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts.
/// ...
/// V has an extension type member m with a uniquely determined declaration Dm
/// ...
/// If Dm is a method with function type F, and args is omitted, the invocation
/// has static type F
///
/// @description Checks static type of a method tear-off with omitted type
/// arguments of an extension type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

extension type ET1(int id) {
  int foo<T1, T2 extends num>() => 42;
}

extension type IC2<T extends num>(T id) {
  T foo<T1, T2 extends T>() => id;
}

extension type IC3<T>(T id) {
  Map<K, V> asMap<K, V extends T>(K key) => {key: this.id as V};
}

main() {
  ET1 et1 = ET1(42);
  et1.foo.expectStaticType<Exactly<int Function<T1, T2 extends num>()>>();

  ET2<num> et2 = ET2<double>(3.14);
  et2.foo.expectStaticType<Exactly<num Function<T1, T2 extends num>()>>();

  ET2<double> et2_2 = ET2(3.14);
  et2_2.foo
      .expectStaticType<Exactly<double Function<T1, T2 extends double>()>>();

  ET3<int> et3 = ET3(0);
  et3.asMap
      .expectStaticType<Exactly<Map<K, V> Function<K, V extends int>(K)>>();
}
