// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The function signature of the augmenting function does not exactly match
///   the function signature of the augmented function. This means that any
///   provided return types must be the same type; there must be same number or
///   required and optional positional parameters, all with the same types (when
///   provided), the same number of named parameters, each pairwise with the
///   same name, same type (when provided) and same `required` and `covariant`
///   modifiers, and any type parameters and their bounds (when provided) must
///   be the same (like for type declarations).
///
/// @description Checks that it is a compile-time error if type of parameters of
/// an augmentation doesn't exactly match the original function. Test the case
/// when function argument is a top type.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t24_lib1.dart';
import augment 'augmenting_functions_A04_t24_lib2.dart';

void topLevelFunction1(Object? _) {}
void topLevelFunction2(dynamic _) {}
void topLevelFunction3(void _) {}

class C {
  static void staticMethod1(Object? _) {}
  static void staticMethod2(dynamic _) {}
  static void staticMethod3(void _) {}
  void instanceMethod1(Object? _) {}
  void instanceMethod2(dynamic _) {}
  void instanceMethod3(void _) {}
}

mixin M {
  static void staticMethod1(Object? _) {}
  static void staticMethod2(dynamic _) {}
  static void staticMethod3(void _) {}
  void instanceMethod1(Object? _) {}
  void instanceMethod2(dynamic _) {}
  void instanceMethod3(void _) {}
}

enum E {
  e1;

  static void staticMethod1(Object? _) {}
  static void staticMethod2(dynamic _) {}
  static void staticMethod3(void _) {}
  void instanceMethod1(Object? _) {}
  void instanceMethod2(dynamic _) {}
  void instanceMethod3(void _) {}
}

class A {}

extension Ext on A {
  static void staticMethod1(Object? _) {}
  static void staticMethod2(dynamic _) {}
  static void staticMethod3(void _) {}
  void instanceMethod1(Object? _) {}
  void instanceMethod2(dynamic _) {}
  void instanceMethod3(void _) {}
}

extension type ET(int _) {
  static void staticMethod1(Object? _) {}
  static void staticMethod2(dynamic _) {}
  static void staticMethod3(void _) {}
  void instanceMethod1(Object? _) {}
  void instanceMethod2(dynamic _) {}
  void instanceMethod3(void _) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
