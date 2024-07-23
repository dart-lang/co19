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

import augment 'augmenting_functions_A04_t22_lib.dart';
import '../../Utils/expect.dart';

topLevelFunction1() => "original";
String topLevelFunction2(var s) => "original";
String topLevelFunction3(_) => "original";

class C {
  static staticMethod1() => "original";
  static String staticMethod2(var s) => "original";
  static String staticMethod3(_) => "original";
  instanceMethod1() => "original";
  String instanceMethod2(var s) => "original";
  String instanceMethod3(_) => "original";
}

mixin M {
  static staticMethod1() => "original";
  static String staticMethod2(var s) => "original";
  static String staticMethod3(_) => "original";
  instanceMethod1() => "original";
  String instanceMethod2(var s) => "original";
  String instanceMethod3(_) => "original";
}

enum E {
  e1;

  static staticMethod1() => "original";
  static String staticMethod2(var s) => "original";
  static String staticMethod3(_) => "original";
  instanceMethod1() => "original";
  String instanceMethod2(var s) => "original";
  String instanceMethod3(_) => "original";
}

class A {}

extension Ext on A {
  static staticMethod1() => "original";
  static String staticMethod2(var s) => "original";
  static String staticMethod3(_) => "original";
  instanceMethod1() => "original";
  String instanceMethod2(var s) => "original";
  String instanceMethod3(_) => "original";
}

extension type ET(int _) {
  static staticMethod1() => "original";
  static String staticMethod2(var s) => "original";
  static String staticMethod3(_) => "original";
  instanceMethod1() => "original";
  String instanceMethod2(var s) => "original";
  String instanceMethod3(_) => "original";
}

class MA = Object with M;

main() {
  Expect.equals("augmented", topLevelFunction1());
  Expect.equals("augmented X", topLevelFunction2("X"));
  Expect.equals("augmented Y", topLevelFunction3("Y"));

  Expect.equals("augmented", C.staticMethod1());
  Expect.equals("augmented X", C.staticMethod2("X"));
  Expect.equals("augmented Y", C.staticMethod3("Y"));
  Expect.equals("augmented", C().instanceMethod1());
  Expect.equals("augmented X", C().instanceMethod2("X"));
  Expect.equals("augmented Y", C().instanceMethod3("Y"));

  Expect.equals("augmented", M.staticMethod1());
  Expect.equals("augmented X", M.staticMethod2("X"));
  Expect.equals("augmented Y", M.staticMethod3("Y"));
  Expect.equals("augmented", MA().instanceMethod1());
  Expect.equals("augmented X", MA().instanceMethod2("X"));
  Expect.equals("augmented Y", MA().instanceMethod3("Y"));

  Expect.equals("augmented", E.staticMethod1());
  Expect.equals("augmented X", E.staticMethod2("X"));
  Expect.equals("augmented Y", E.staticMethod3("Y"));
  Expect.equals("augmented", E.e1.instanceMethod1());
  Expect.equals("augmented X", E.e1.instanceMethod2("X"));
  Expect.equals("augmented Y", E.e1.instanceMethod3("Y"));

  Expect.equals("augmented", Ext.staticMethod1());
  Expect.equals("augmented X", Ext.staticMethod2("X"));
  Expect.equals("augmented Y", Ext.staticMethod3("Y"));
  Expect.equals("augmented", A().instanceMethod1());
  Expect.equals("augmented X", A().instanceMethod2("X"));
  Expect.equals("augmented Y", A().instanceMethod3("Y"));

  Expect.equals("augmented", ET.staticMethod1());
  Expect.equals("augmented X", ET.staticMethod2("X"));
  Expect.equals("augmented Y", ET.staticMethod3("Y"));
  Expect.equals("augmented", ET(0).instanceMethod1());
  Expect.equals("augmented X", ET(0).instanceMethod2("X"));
  Expect.equals("augmented Y", ET(0).instanceMethod3("Y"));
}
