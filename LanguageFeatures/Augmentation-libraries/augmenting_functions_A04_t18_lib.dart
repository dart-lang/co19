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
/// @description Checks that it is not an error if return type and  parameters
/// of an augmentation exactly matches the original function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t18.dart';

augment String topLevelFunction1() => "augmented";
augment Object topLevelFunction2(String s0) => "augmented $s0";
augment int topLevelFunction3([int i0 = 0]) => i0 + 1;
augment int? topLevelFunction4({int? i}) => i;
augment T topLevelFunction5<T extends num>(T t) => t + 1 as T;

augment class C {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0 = 0]) => i0 + 1;
  augment static int? staticMethod4({int? i}) => i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0 = 0]) => i0 + 1;
  augment int? instanceMethod4({int? i}) => i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment mixin M {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0 = 0]) => i0 + 1;
  augment static int? staticMethod4({int? i}) => i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0 = 0]) => i0 + 1;
  augment int? instanceMethod4({int? i}) => i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
  }

augment enum E {
  augment e1;

  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0 = 0]) => i0 + 1;
  augment static int? staticMethod4({int? i}) => i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0 = 0]) => i0 + 1;
  augment int? instanceMethod4({int? i}) => i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}

augment extension Ext {
  augment static Object staticMethod1() => "augmented";
  augment static String staticMethod2(String s0) => "augmented $s0";
  augment static int staticMethod3([int i0 = 0]) => i0 + 1;
  augment static int? staticMethod4({int? i}) => i;
  augment static T staticMethod5<T extends num>(T t) => t + 1 as T;

  augment Object instanceMethod1() => "augmented";
  augment String instanceMethod2(String s0) => "augmented $s0";
  augment int instanceMethod3([int i0 = 0]) => i0 + 1;
  augment int? instanceMethod4({int? i}) => i;
  augment T instanceMethod5<T extends num>(T t) => t + 1 as T;
}
