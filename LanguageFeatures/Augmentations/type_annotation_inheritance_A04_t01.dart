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
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a different return type than the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'type_annotation_inheritance_A04_t01_lib.dart';

num get topLevelGetter => 0;
num topLevelFunction() => 0;

class C {
  static num get staticGetter => 0;
  static num staticMethod() => 0;
  num get instanceGetter => 0;
  num instanceMethod() => 0;
}

mixin M {
  static num get staticGetter => 0;
  static num staticMethod() => 0;
  num get instanceGetter => 0;
  num instanceMethod() => 0;
}

enum E {
  e0;
  static num get staticGetter => 0;
  static num staticMethod() => 0;
  num get instanceGetter => 0;
  num instanceMethod() => 0;
}

class A {}

extension Ext on A {
  static num get staticGetter => 0;
  static num staticMethod() => 0;
  num get instanceGetter => 0;
  num instanceMethod() => 0;
}

extension type ET(num id) {
  static num get staticGetter => 0;
  static num staticMethod() => 0;
  num get instanceGetter => 0;
  num instanceMethod() => 0;
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
