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
/// of an augmentation exactly matches the original function. Test implicit
/// `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A04_t22.dart';

augment dynamic topLevelFunction1() => "augmented";
augment String topLevelFunction2(dynamic s0) => "augmented $s0";
augment String topLevelFunction3(dynamic v) => "augmented $v";

augment class C {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment mixin M {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment enum E {
  augment e1;

  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment extension Ext {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment extension type ET {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}
