// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is not omitted,
/// then it's a compile-time error if the type denoted by the augmenting
/// declaration is not the same type as the type in the corresponding
/// declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a formal parameter type other than the introductory
/// declaration. Test setters and top types (for functions see
/// `augmenting_functions_A04_t24.dart`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'type_annotation_inheritance_A06_t03_lib1.dart';
part 'type_annotation_inheritance_A06_t03_lib2.dart';

void topLevelSetter1(Object? _) {}
void topLevelSetter2(dynamic _) {}
void topLevelSetter3(void _) {}

class C {
  static void staticSetter1(Object? _) {}
  static void staticSetter2(dynamic _) {}
  static void staticSetter3(void _) {}
  void instanceSetter1(Object? _) {}
  void instanceSetter2(dynamic _) {}
  void instanceSetter3(void _) {}
}

mixin M {
  static void staticSetter1(Object? _) {}
  static void staticSetter2(dynamic _) {}
  static void staticSetter3(void _) {}
  void instanceSetter1(Object? _) {}
  void instanceSetter2(dynamic _) {}
  void instanceSetter3(void _) {}
}

enum E {
  e1;

  static void staticSetter1(Object? _) {}
  static void staticSetter2(dynamic _) {}
  static void staticSetter3(void _) {}
  void instanceSetter1(Object? _) {}
  void instanceSetter2(dynamic _) {}
  void instanceSetter3(void _) {}
}

class A {}

extension Ext on A {
  static void staticSetter1(Object? _) {}
  static void staticSetter2(dynamic _) {}
  static void staticSetter3(void _) {}
  void instanceSetter1(Object? _) {}
  void instanceSetter2(dynamic _) {}
  void instanceSetter3(void _) {}
}

extension type ET(int _) {
  static void staticSetter1(Object? _) {}
  static void staticSetter2(dynamic _) {}
  static void staticSetter3(void _) {}
  void instanceSetter1(Object? _) {}
  void instanceSetter2(dynamic _) {}
  void instanceSetter3(void _) {}
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
