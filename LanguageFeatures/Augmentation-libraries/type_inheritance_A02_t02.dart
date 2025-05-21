// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is no error if augmenting declaration specifies
/// the same return type as the introductory declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

import '../../Utils/expect.dart';
part 'type_inheritance_A02_t02_lib.dart';

get topLevelGetter;
topLevelFunction() => 0;

class C {
  static get staticGetter => 0;
  static staticMethod();
  get instanceGetter;
  instanceMethod() => 0;
}

mixin M {
  static get staticGetter => 0;
  static staticMethod();
  get instanceGetter;
  instanceMethod() => 0;
}

enum E {
  e0;
  static get staticGetter => 0;
  static staticMethod();
  get instanceGetter;
  instanceMethod() => 0;
}

class A {}

extension Ext on A {
  static get staticGetter => 0;
  static staticMethod();
  get instanceGetter;
  instanceMethod() => 0;
}

extension type ET(int id) {
  static get staticGetter => 0;
  static staticMethod();
  get instanceGetter;
  instanceMethod() => 0;
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelGetter);
  Expect.equals(0, topLevelFunction());
  Expect.equals(0, C.staticGetter);
  Expect.equals(1, C.staticMethod());
  Expect.equals(1, C().instanceGetter);
  Expect.equals(0, C().instanceMethod());
  Expect.equals(0, M.staticGetter);
  Expect.equals(1, M.staticMethod());
  Expect.equals(1, MA().instanceGetter);
  Expect.equals(0, MA().instanceMethod());
  Expect.equals(0, E.staticGetter);
  Expect.equals(1, E.staticMethod());
  Expect.equals(1, E.e0.instanceGetter);
  Expect.equals(0, E.e0.instanceMethod());
  Expect.equals(0, Ext.staticGetter);
  Expect.equals(1, Ext.staticMethod());
  Expect.equals(1, A().instanceGetter);
  Expect.equals(0, A().instanceMethod());
  Expect.equals(0, ET.staticGetter);
  Expect.equals(1, ET.staticMethod());
  Expect.equals(1, ET(0).instanceGetter);
  Expect.equals(0, ET(0).instanceMethod());
}
