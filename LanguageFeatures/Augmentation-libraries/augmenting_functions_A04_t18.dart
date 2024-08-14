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
/// @description Checks that it is not an error if return type and  parameters
/// of an augmentation exactly matches the original function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t18_lib.dart';
import '../../Utils/expect.dart';

String topLevelFunction1() => "42";
Object topLevelFunction2(String s) => s;
int topLevelFunction3([int i = 0]) => i;
int? topLevelFunction4({int? i, int j = 0}) => null;
T topLevelFunction5<T extends num>(T t) => t;

class C {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i, int j = 0}) => null;
  static T staticMethod5<T extends num>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i, int j = 0}) => null;
  T instanceMethod5<T extends num>(T t) => t;
}

mixin M {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i, int j = 0}) => null;
  static T staticMethod5<T extends num>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i, int j = 0}) => null;
  T instanceMethod5<T extends num>(T t) => t;
}

enum E {
  e1;

  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i, int j = 0}) => null;
  static T staticMethod5<T extends num>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i, int j = 0}) => null;
  T instanceMethod5<T extends num>(T t) => t;
}

class A {}

extension Ext on A {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i, int j = 0}) => null;
  static T staticMethod5<T extends num>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i, int j = 0}) => null;
  T instanceMethod5<T extends num>(T t) => t;
}

extension type ET(int _) {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i, int j = 0}) => null;
  static T staticMethod5<T extends num>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i, int j = 0}) => null;
  T instanceMethod5<T extends num>(T t) => t;
}

class MA = Object with M;

main() {
  Expect.equals("augmented", topLevelFunction1());
  Expect.equals("augmented X", topLevelFunction2("X"));
  Expect.equals(1, topLevelFunction3());
  Expect.equals(3, topLevelFunction4(i: 1, j: 2));
  Expect.equals(2, topLevelFunction5<int>(1));

  Expect.equals("augmented", C.staticMethod1());
  Expect.equals("augmented X", C.staticMethod2("X"));
  Expect.equals(1, C.staticMethod3());
  Expect.equals(3, C.staticMethod4(i: 1, j: 2));
  Expect.equals(2, C.staticMethod5<int>(1));
  Expect.equals("augmented", C().instanceMethod1());
  Expect.equals("augmented X", C().instanceMethod2("X"));
  Expect.equals(1, C().instanceMethod3());
  Expect.equals(3, C().instanceMethod4(i: 1, j: 2));
  Expect.equals(2, C().instanceMethod5<int>(1));

  Expect.equals("augmented", M.staticMethod1());
  Expect.equals("augmented X", M.staticMethod2("X"));
  Expect.equals(1, M.staticMethod3());
  Expect.equals(3, M.staticMethod4(i: 1, j: 2));
  Expect.equals(2, M.staticMethod5<int>(1));
  Expect.equals("augmented", MA().instanceMethod1());
  Expect.equals("augmented X", MA().instanceMethod2("X"));
  Expect.equals(1, MA().instanceMethod3());
  Expect.equals(3, MA().instanceMethod4(i: 1, j: 2));
  Expect.equals(2, MA().instanceMethod5<int>(1));

  Expect.equals("augmented", E.staticMethod1());
  Expect.equals("augmented X", E.staticMethod2("X"));
  Expect.equals(1, E.staticMethod3());
  Expect.equals(3, E.staticMethod4(i: 1, j: 2));
  Expect.equals(2, E.staticMethod5<int>(1));
  Expect.equals("augmented", E.e1.instanceMethod1());
  Expect.equals("augmented X", E.e1.instanceMethod2("X"));
  Expect.equals(1, E.e1.instanceMethod3());
  Expect.equals(3, E.e1.instanceMethod4(i: 1, j: 2));
  Expect.equals(2, E.e1.instanceMethod5<int>(1));

  Expect.equals("augmented", Ext.staticMethod1());
  Expect.equals("augmented X", Ext.staticMethod2("X"));
  Expect.equals(1, Ext.staticMethod3());
  Expect.equals(3, Ext.staticMethod4(i: 1, j: 2));
  Expect.equals(2, Ext.staticMethod5<int>(1));
  Expect.equals("augmented", A().instanceMethod1());
  Expect.equals("augmented X", A().instanceMethod2("X"));
  Expect.equals(1, A().instanceMethod3());
  Expect.equals(3, A().instanceMethod4(i: 1, j: 2));
  Expect.equals(2, A().instanceMethod5<int>(1));

  Expect.equals("augmented", ET.staticMethod1());
  Expect.equals("augmented X", ET.staticMethod2("X"));
  Expect.equals(1, ET.staticMethod3());
  Expect.equals(3, ET.staticMethod4(i: 1, j: 2));
  Expect.equals(2, ET.staticMethod5<int>(1));
  Expect.equals("augmented", ET(0).instanceMethod1());
  Expect.equals("augmented X", ET(0).instanceMethod2("X"));
  Expect.equals(1, ET(0).instanceMethod3());
  Expect.equals(3, ET(0).instanceMethod4(i: 1, j: 2));
  Expect.equals(2, ET(0).instanceMethod5<int>(1));
}
