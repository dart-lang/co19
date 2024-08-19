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

augment library 'augmenting_functions_A04_t18.dart';

augment String topLevelFunction1() => "augmented";
augment Object topLevelFunction2(String s0) => "augmented $s0";
augment int topLevelFunction3([int i0]) => i0 + 1;
augment int? topLevelFunction4({int j, int? i}) => i == null ? 0 : j + i;
augment T topLevelFunction5<T extends num>(T t) => t + 1 as T;

augment class C {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0]) => i0 + 1;
  augment static int? staticMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0]) => i0 + 1;
  augment int? instanceMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment mixin M {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0]) => i0 + 1;
  augment static int? staticMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0]) => i0 + 1;
  augment int? instanceMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment enum E {
  augment e1;

  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0]) => i0 + 1;
  augment static int? staticMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0]) => i0 + 1;
  augment int? instanceMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment extension Ext {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0]) => i0 + 1;
  augment static int? staticMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0]) => i0 + 1;
  augment int? instanceMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment extension type ET {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0]) => i0 + 1;
  augment static int? staticMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0]) => i0 + 1;
  augment int? instanceMethod4({int j, int? i}) => i == null ? 0 : j + i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}
