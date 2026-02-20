// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may omit type annotations for a return
/// type, variable type, parameter type, or type parameter bound. In the last
/// case, that includes omitting the `extends` keyword. For a variable, a `var`
/// keyword replaces the type if the variable isn't `final`.
///
/// If a type annotation or type parameter bound is omitted in the augmenting
/// declaration, it is inferred to be the same as the corresponding type
/// annotation or type parameter bound in the declaration being augmented.
///
/// @description Checks that it is not an error if an augmentation omits the
/// bounds of the type parameters of a class-like declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C<T extends num> {}

augment class C<T> {}

mixin M<T extends num> {
  getType() => T;
}

augment mixin M<T> {}

enum E<T extends num> {
  e1;
}

augment enum E<T> {
  ;
}

class A {}

extension Ext<T extends num> on A {
  getType() => T;
}

augment extension Ext<T> {}

extension type ET<T extends num>(int _) {}

augment extension type ET<T> {}

class MA = Object with M;

main() {
  C().expectStaticType<Exactly<C<num>>>();
  Expect.isTrue(MA().getType() is num);
  E.e1.expectStaticType<Exactly<E<num>>>();
  Expect.isTrue(A().getType() is num);
  ET(0).expectStaticType<Exactly<ET<num>>>();
}
