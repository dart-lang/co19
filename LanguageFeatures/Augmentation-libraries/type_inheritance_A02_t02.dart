// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// When applying an augmenting declaration that contains a type annotation at
/// one of these positions, to a definition to be augmented, it's a compile-time
/// error if the type denoted by the augmenting declaration is not the same type
/// as the type that the augmented definition has at the corresponding position.
/// An augmenting declaration can omit type annotations, but if it doesn't, it
/// must repeat the type from the augmented definition.
///
/// @description Check that it is no error if augmenting declaration specifies
/// the same return type as the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'type_inheritance_A02_t02_lib.dart';
import '../../Utils/expect.dart';

get topLevelGetter => 0;
topLevelFunction() => 0;

class C {
  static get staticGetter => 0;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod() => 0;
}

mixin M {
  static get staticGetter => 0;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod() => 0;
}

enum E {
  e0;
  static get staticGetter => 0;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod() => 0;
}

class A {}

extension Ext on A {
  static get staticGetter => 0;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod() => 0;
}

extension type ET(int id) {
  static get staticGetter => 0;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod() => 0;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelGetter);
  Expect.equals(2, topLevelFunction());
  Expect.equals(3, C.staticGetter);
  Expect.equals(4, C.staticMethod());
  Expect.equals(5, C().instanceGetter);
  Expect.equals(6, C().instanceMethod());
  Expect.equals(7, M.staticGetter);
  Expect.equals(8, M.staticMethod());
  Expect.equals(9, MA().instanceGetter);
  Expect.equals(10, MA().instanceMethod());
  Expect.equals(11, E.staticGetter);
  Expect.equals(12, E.staticMethod());
  Expect.equals(13, E.e0.instanceGetter);
  Expect.equals(14, E.e0.instanceMethod());
  Expect.equals(15, Ext.staticGetter);
  Expect.equals(16, Ext.staticMethod());
  Expect.equals(17, A().instanceGetter);
  Expect.equals(18, A().instanceMethod());
  Expect.equals(19, ET.staticGetter);
  Expect.equals(20, ET.staticMethod());
  Expect.equals(21, ET(0).instanceGetter);
  Expect.equals(22, ET(0).instanceMethod());
}
