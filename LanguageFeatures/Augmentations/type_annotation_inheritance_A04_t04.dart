// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is not omitted,
/// then it's a compile-time error if the type denoted by the augmenting
/// declaration is not the same type as the type in the corresponding
/// declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a different return type than the introductory
/// declaration. Test a wrong top type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'type_annotation_inheritance_A04_t04_lib.dart';

get topLevelGetter;
topLevelFunction() => 0;

class C {
  static get staticGetter;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod();
}

mixin M {
  static get staticGetter;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod();
}

enum E {
  e0;
  static get staticGetter;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod();
}

class A {}

extension Ext on A {
  static get staticGetter;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod();
}

extension type ET(int id) {
  static get staticGetter;
  static staticMethod() => 0;
  get instanceGetter => 0;
  instanceMethod();
}

main() {
  topLevelGetter;
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
