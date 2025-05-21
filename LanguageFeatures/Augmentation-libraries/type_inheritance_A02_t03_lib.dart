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

part of 'type_inheritance_A02_t03.dart';

augment NumAlias get topLevelGetter => 1;
augment NumAlias topLevelFunction();

augment class C {
  augment static NumAlias get staticGetter;
  augment static NumAlias staticMethod() => 1;
  augment NumAlias get instanceGetter => 1;
  augment NumAlias instanceMethod();
}

augment mixin M {
  augment static NumAlias get staticGetter;
  augment static NumAlias staticMethod() => 1;
  augment NumAlias get instanceGetter => 1;
  augment NumAlias instanceMethod();
}

augment enum E {
  augment e0;
  augment static NumAlias get staticGetter;
  augment static NumAlias staticMethod() => 1;
  augment NumAlias get instanceGetter => 1;
  augment NumAlias instanceMethod();
}

augment extension Ext {
  augment static NumAlias get staticGetter;
  augment static NumAlias staticMethod() => 1;
  augment NumAlias get instanceGetter => 1;
  augment NumAlias instanceMethod();
}

augment extension type ET {
  augment static NumAlias get staticGetter;
  augment static NumAlias staticMethod() => 1;
  augment NumAlias get instanceGetter => 1;
  augment NumAlias instanceMethod();
  augment NumAlias get id;
}
