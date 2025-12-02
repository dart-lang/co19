// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional and optional parameters as the
///   augmented declaration.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For all corresponding pairs of parameters:
///   - They have the same type (if not omitted in the augmenting declaration).
///   - They have the same `required` and `covariant` modifiers.
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
///     doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if return type and  parameters
/// of an augmentation exactly matches the original function. Test implicit
/// `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

topLevelFunction1() => "A";
String topLevelFunction2(var s) => "B";
String topLevelFunction3(v) => "C";

augment dynamic topLevelFunction1();
augment String topLevelFunction2(dynamic s);
augment String topLevelFunction3(dynamic v);

class C {
  static staticMethod1() => "A";
  static String staticMethod2(var s) => "B";
  static String staticMethod3(v) => "C";

  instanceMethod1() => "D";
  String instanceMethod2(var s) => "E";
  String instanceMethod3(v) => "F";
}

augment class C {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic s);
  augment static String staticMethod3(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic s);
  augment String instanceMethod3(dynamic v);
}

mixin M {
  static staticMethod1() => "A";
  static String staticMethod2(var s) => "B";
  static String staticMethod3(v) => "C";

  instanceMethod1() => "D";
  String instanceMethod2(var s) => "E";
  String instanceMethod3(v) => "F";
}

augment mixin M {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic s);
  augment static String staticMethod3(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic s);
  augment String instanceMethod3(dynamic v);
}

enum E {
  e1;
  static staticMethod1() => "A";
  static String staticMethod2(var s) => "B";
  static String staticMethod3(v) => "C";

  instanceMethod1() => "D";
  String instanceMethod2(var s) => "E";
  String instanceMethod3(v) => "F";
}

augment enum E {
  ;
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic s);
  augment static String staticMethod3(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic s);
  augment String instanceMethod3(dynamic v);
}

class A {}

extension Ext on A {
  static staticMethod1() => "A";
  static String staticMethod2(var s) => "B";
  static String staticMethod3(v) => "C";

  instanceMethod1() => "D";
  String instanceMethod2(var s) => "E";
  String instanceMethod3(v) => "F";
}

augment extension Ext {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic s);
  augment static String staticMethod3(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic s);
  augment String instanceMethod3(dynamic v);
}

extension type ET(int _) {
  static staticMethod1() => "A";
  static String staticMethod2(var s) => "B";
  static String staticMethod3(v) => "C";

  instanceMethod1() => "D";
  String instanceMethod2(var s) => "E";
  String instanceMethod3(v) => "F";
}

augment extension type ET {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic s);
  augment static String staticMethod3(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic s);
  augment String instanceMethod3(dynamic v);
}

class MA = Object with M;

main() {
  Expect.equals("A", topLevelFunction1());
  Expect.equals("B", topLevelFunction2(42));
  Expect.equals("C", topLevelFunction3(true));

  Expect.equals("A", C.staticMethod1());
  Expect.equals("B", C.staticMethod2(42));
  Expect.equals("C", C.staticMethod3(""));
  Expect.equals("D", C().instanceMethod1());
  Expect.equals("E", C().instanceMethod2(3.14));
  Expect.equals("F", C().instanceMethod3(true));

  Expect.equals("A", M.staticMethod1());
  Expect.equals("B", M.staticMethod2(42));
  Expect.equals("C", M.staticMethod3(""));
  Expect.equals("D", MA().instanceMethod1());
  Expect.equals("E", MA().instanceMethod2(3.14));
  Expect.equals("F", MA().instanceMethod3(true));

  Expect.equals("A", E.staticMethod1());
  Expect.equals("B", E.staticMethod2(42));
  Expect.equals("C", E.staticMethod3(""));
  Expect.equals("D", E.e1.instanceMethod1());
  Expect.equals("E", E.e1.instanceMethod2(3.14));
  Expect.equals("F", E.e1.instanceMethod3(true));

  Expect.equals("A", Ext.staticMethod1());
  Expect.equals("B", Ext.staticMethod2(42));
  Expect.equals("C", Ext.staticMethod3(""));
  Expect.equals("D", A().instanceMethod1());
  Expect.equals("E", A().instanceMethod2(3.14));
  Expect.equals("F", A().instanceMethod3(true));

  Expect.equals("A", ET.staticMethod1());
  Expect.equals("B", ET.staticMethod2(42));
  Expect.equals("C", ET.staticMethod3(""));
  Expect.equals("D", ET(0).instanceMethod1());
  Expect.equals("E", ET(0).instanceMethod2(3.14));
  Expect.equals("F", ET(0).instanceMethod3(true));
}
