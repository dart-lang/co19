// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the function augmentation does not exactly match the
///   original function. This means the return types must be the same; there
///   must be the same number of positional, optional, and named parameters; the
///   types of corresponding positional and optional parameters must be the
///   same; the names and types of named parameters must be the same; any type
///   parameters and bounds must be the same; and any required or covariant
///   modifiers must match.
///
/// @description Checks that it is a compile-time error if return type of an
/// augmentation doesn't exactly match the original function
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A04_t01_lib.dart';

String topLevelFunction1() => "42";
Object topLevelFunction2() => "42";
String topLevelFunction3() => "42";
T topLevelFunction4<T extends String>(T t) => t;
String topLevelFunction5<T extends String>(T t) => t;

class C {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

mixin M {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

enum E {
  e1;

  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

class A {}

extension Ext on A {
  static String staticMethod1() => "42";
  static Object staticMethod2() => "42";
  static String staticMethod3() => "42";
  static T staticMethod4<T extends String>(T t) => t;
  static String staticMethod5<T extends String>(T t) => t;
  String instanceMethod1() => "42";
  Object instanceMethod2() => "42";
  String instanceMethod3() => "42";
  T instanceMethod4<T extends String>(T t) => t;
  String instanceMethod5<T extends String>(T t) => t;
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(topLevelFunction3);
  print(topLevelFunction4);
  print(topLevelFunction5);
  print(C);
  print(M);
  print(E);
  print(A);
}
