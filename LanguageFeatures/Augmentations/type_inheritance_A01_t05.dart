// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may omit type parameter bound
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/static_type_helper.dart';
part 'type_inheritance_A01_t05_lib.dart';

void topLevelFunction<T extends num>(T v) {}

class C<T extends num> {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

mixin M<T extends num> {
  static void staticMethod<X extends num>(X _) {}
  void instanceMethod<X extends num>(X _);
}

enum E<T extends num> {
  e0;
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

class A {}

extension Ext<T extends num> on A {
  static void staticMethod<X extends num>(X _) {}
  void instanceMethod<X extends num>(X _);
  void typeCheck(T t) {}
}

extension type ET<T extends num>(int id) {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

class MA = Object with M;

main() {
  topLevelFunction.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C().expectStaticType<Exactly<C<num>>>();
  C.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  C().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MA().expectStaticType<SubtypeOf<M<num>>>();
  M.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  MA().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E.e0.expectStaticType<Exactly<E<num>>>();
  E.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  E.e0.instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
  A().typeCheck.expectStaticType<Exactly<void Function(num)>>();
  Ext.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  A().instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();

  ET(0).expectStaticType<Exactly<ET<num>>>();
  ET.staticMethod.expectStaticType<Exactly<void Function<T extends num>(T)>>();
  ET(0).instanceMethod
      .expectStaticType<Exactly<void Function<T extends num>(T)>>();
}
