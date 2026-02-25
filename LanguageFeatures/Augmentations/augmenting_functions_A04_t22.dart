// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if the return type and
/// parameters of an augmentation exactly match the original function. Test
/// implicit `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

topLevelFunction1() => "A";
String topLevelFunction2(v) => "B";

augment dynamic topLevelFunction1();
augment String topLevelFunction2(dynamic v);

class C {
  static staticMethod1() => "A";
  static String staticMethod2(v) => "B";

  instanceMethod1() => "C";
  String instanceMethod2(v) => "D";
}

augment class C {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic v);
}

mixin M {
  static staticMethod1() => "A";
  static String staticMethod2(v) => "B";

  instanceMethod1() => "C";
  String instanceMethod2(v) => "D";
}

augment mixin M {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic v);
}

enum E {
  e1;
  static staticMethod1() => "A";
  static String staticMethod2(v) => "B";

  instanceMethod1() => "C";
  String instanceMethod2(v) => "D";
}

augment enum E {
  ;
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic v);
}

class A {}

extension Ext on A {
  static staticMethod1() => "A";
  static String staticMethod2(v) => "B";

  instanceMethod1() => "C";
  String instanceMethod2(v) => "D";
}

augment extension Ext {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic v);
}

extension type ET(int _) {
  static staticMethod1() => "A";
  static String staticMethod2(v) => "B";

  instanceMethod1() => "C";
  String instanceMethod2(v) => "D";
}

augment extension type ET {
  augment static dynamic staticMethod1();
  augment static String staticMethod2(dynamic v);

  augment dynamic instanceMethod1();
  augment String instanceMethod2(dynamic v);
}

class MA = Object with M;

main() {
  Expect.equals("A", topLevelFunction1());
  Expect.equals("B", topLevelFunction2(42));

  Expect.equals("A", C.staticMethod1());
  Expect.equals("B", C.staticMethod2(42));
  Expect.equals("C", C().instanceMethod1());
  Expect.equals("D", C().instanceMethod2(true));

  Expect.equals("A", M.staticMethod1());
  Expect.equals("B", M.staticMethod2(42));
  Expect.equals("C", MA().instanceMethod1());
  Expect.equals("D", MA().instanceMethod2(true));

  Expect.equals("A", E.staticMethod1());
  Expect.equals("B", E.staticMethod2(42));
  Expect.equals("C", E.e1.instanceMethod1());
  Expect.equals("D", E.e1.instanceMethod2(true));

  Expect.equals("A", Ext.staticMethod1());
  Expect.equals("B", Ext.staticMethod2(42));
  Expect.equals("C", A().instanceMethod1());
  Expect.equals("D", A().instanceMethod2(true));

  Expect.equals("A", ET.staticMethod1());
  Expect.equals("B", ET.staticMethod2(42));
  Expect.equals("C", ET(0).instanceMethod1());
  Expect.equals("D", ET(0).instanceMethod2(true));
}
