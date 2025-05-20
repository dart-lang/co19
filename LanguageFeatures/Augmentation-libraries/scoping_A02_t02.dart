// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is already a compile-time error for multiple declarations to
/// have the same name in the same scope. This error is checked after part files
/// and augmentations have been applied. In other words, it's an error to
/// declare the same top-level name in a library and a part, the same top-level
/// name in two parts, the same static or instance name inside an introductory
/// declaration and an augmentation on that declaration, or the same static or
/// instance name inside two augmentations of the same declaration.
///
/// @description Checks that it is a compile time error for both a static and
/// instance member of the same name to be defined on the same type, even if
/// they live in different lexical scopes.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'scoping_A02_t02_lib.dart';

class C {
  String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

mixin M {
  String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

enum E {
  e0;
  final String foo = "";
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

class A {}

extension Ext on A {
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

extension type ET(String id) {
  String get bar => "";
  void set baz(String _) {}
  String qux() => "";
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
