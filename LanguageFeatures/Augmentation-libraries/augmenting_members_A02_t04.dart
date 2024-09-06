// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A non-writable variable declaration is augmented with a setter.
///
/// @description Checks that it is a compile-time error if a getter declaration
/// is augmented with a setter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_members_A02_t04_lib.dart';

String get topLevelGetter => "topLevelGetter";

class C {
  static String get staticGetter => "staticGetter";
  String get instanceGetter => "instanceGetter";
}

mixin M {
  static String get staticGetter => "staticGetter";
  String get instanceGetter => "instanceGetter";
}

enum E {
  e0;
  static String get staticGetter => "staticGetter";
  String get instanceGetter => "instanceGetter";
}

class A {}

extension Ext on A {
  static String get staticGetter => "staticGetter";
  String get instanceGetter => "instanceGetter";
}

extension type ET(String _) {
  static String get staticGetter => "staticGetter";
  String get instanceGetter => "instanceGetter";
}

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
