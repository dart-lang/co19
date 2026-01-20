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

part 'type_annotation_inheritance_A04_t05_lib.dart';

topLevelFunction() {}

class C {
  static staticMethod() {}
  instanceMethod();
}

mixin M {
  static staticMethod();
  instanceMethod() {}
}

enum E {
  e0;
  static staticMethod() {}
  instanceMethod();
}

class A {}

extension Ext on A {
  static staticMethod();
  instanceMethod() {}
}

extension type ET(int id) {
  static staticMethod() {}
  instanceMethod();
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
