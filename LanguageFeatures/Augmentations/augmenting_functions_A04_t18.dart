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
/// parameters of an augmentation exactly matches the original function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String topLevelFunction1() => "42";

augment String topLevelFunction1();

Object topLevelFunction2(String s) => s;

augment Object topLevelFunction2(String s);

int topLevelFunction3([int i = 0]) => i;

augment int topLevelFunction3([int i]);

int? topLevelFunction4({int? i}) => i;

augment int? topLevelFunction4({int? i});

T topLevelFunction5<T extends num>(T t) => t;

augment T topLevelFunction5<T extends num>(T t);

class C {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i = 0}) => i;
  static T staticMethod5<T extends num>(T t) => t;

  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i}) => i;
  T instanceMethod5<T extends num>(T t) => t;
}

augment class C {
  augment static String staticMethod1();
  augment static Object staticMethod2(String s);
  augment static int staticMethod3([int i]);
  augment static int? staticMethod4({int? i});
  augment static T staticMethod5<T extends num>(T t);

  augment String instanceMethod1();
  augment Object instanceMethod2(String s);
  augment int instanceMethod3([int i]);
  augment int? instanceMethod4({int? i});
  augment T instanceMethod5<T extends num>(T t);
}

mixin M {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i = 0}) => i;
  static T staticMethod5<T extends num>(T t) => t;

  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i}) => i;
  T instanceMethod5<T extends num>(T t) => t;
}

augment mixin M {
  augment static String staticMethod1();
  augment static Object staticMethod2(String s);
  augment static int staticMethod3([int i]);
  augment static int? staticMethod4({int? i});
  augment static T staticMethod5<T extends num>(T t);

  augment String instanceMethod1();
  augment Object instanceMethod2(String s);
  augment int instanceMethod3([int i]);
  augment int? instanceMethod4({int? i});
  augment T instanceMethod5<T extends num>(T t);
}

enum E {
  e1;
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i = 0}) => i;
  static T staticMethod5<T extends num>(T t) => t;

  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i}) => i;
  T instanceMethod5<T extends num>(T t) => t;
}

augment enum E {
  ;
  augment static String staticMethod1();
  augment static Object staticMethod2(String s);
  augment static int staticMethod3([int i]);
  augment static int? staticMethod4({int? i});
  augment static T staticMethod5<T extends num>(T t);

  augment String instanceMethod1();
  augment Object instanceMethod2(String s);
  augment int instanceMethod3([int i]);
  augment int? instanceMethod4({int? i});
  augment T instanceMethod5<T extends num>(T t);
}

class A {}

extension Ext on A {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i = 0}) => i;
  static T staticMethod5<T extends num>(T t) => t;

  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i}) => i;
  T instanceMethod5<T extends num>(T t) => t;
}

augment extension Ext {
  augment static String staticMethod1();
  augment static Object staticMethod2(String s);
  augment static int staticMethod3([int i]);
  augment static int? staticMethod4({int? i});
  augment static T staticMethod5<T extends num>(T t);

  augment String instanceMethod1();
  augment Object instanceMethod2(String s);
  augment int instanceMethod3([int i]);
  augment int? instanceMethod4({int? i});
  augment T instanceMethod5<T extends num>(T t);
}

extension type ET(int _) {
  static String staticMethod1() => "42";
  static Object staticMethod2(String s) => s;
  static int staticMethod3([int i = 0]) => i;
  static int? staticMethod4({int? i = 0}) => i;
  static T staticMethod5<T extends num>(T t) => t;

  String instanceMethod1() => "42";
  Object instanceMethod2(String s) => s;
  int instanceMethod3([int i = 0]) => i;
  int? instanceMethod4({int? i}) => i;
  T instanceMethod5<T extends num>(T t) => t;
}

augment extension type ET {
  augment static String staticMethod1();
  augment static Object staticMethod2(String s);
  augment static int staticMethod3([int i]);
  augment static int? staticMethod4({int? i});
  augment static T staticMethod5<T extends num>(T t);

  augment String instanceMethod1();
  augment Object instanceMethod2(String s);
  augment int instanceMethod3([int i]);
  augment int? instanceMethod4({int? i});
  augment T instanceMethod5<T extends num>(T t);
}

class MA = Object with M;

main() {
  Expect.equals("42", topLevelFunction1());
  Expect.equals("X", topLevelFunction2("X"));
  Expect.equals(0, topLevelFunction3());
  Expect.equals(1, topLevelFunction3(1));
  Expect.isNull(topLevelFunction4());
  Expect.equals(2, topLevelFunction4(i: 2));
  Expect.equals(3, topLevelFunction5<int>(3));

  Expect.equals("42", C.staticMethod1());
  Expect.equals("X", C.staticMethod2("X"));
  Expect.equals(0, C.staticMethod3());
  Expect.equals(1, C.staticMethod3(1));
  Expect.equals(0, C.staticMethod4());
  Expect.equals(2, C.staticMethod4(i: 2));
  Expect.equals(3, C.staticMethod5<int>(3));

  Expect.equals("42", C().instanceMethod1());
  Expect.equals("X", C().instanceMethod2("X"));
  Expect.equals(0, C().instanceMethod3());
  Expect.equals(1, C().instanceMethod3(1));
  Expect.isNull(C().instanceMethod4());
  Expect.equals(2, C().instanceMethod4(i: 2));
  Expect.equals(3, C().instanceMethod5<int>(3));

  Expect.equals("42", M.staticMethod1());
  Expect.equals("X", M.staticMethod2("X"));
  Expect.equals(0, M.staticMethod3());
  Expect.equals(1, M.staticMethod3(1));
  Expect.equals(0, M.staticMethod4());
  Expect.equals(2, M.staticMethod4(i: 2));
  Expect.equals(3, M.staticMethod5<int>(3));

  Expect.equals("42", MA().instanceMethod1());
  Expect.equals("X", MA().instanceMethod2("X"));
  Expect.equals(0, MA().instanceMethod3());
  Expect.equals(1, MA().instanceMethod3(1));
  Expect.isNull(MA().instanceMethod4());
  Expect.equals(2, MA().instanceMethod4(i: 2));
  Expect.equals(3, MA().instanceMethod5<int>(3));

  Expect.equals("42", E.staticMethod1());
  Expect.equals("X", E.staticMethod2("X"));
  Expect.equals(0, E.staticMethod3());
  Expect.equals(1, E.staticMethod3(1));
  Expect.equals(0, E.staticMethod4());
  Expect.equals(2, E.staticMethod4(i: 2));
  Expect.equals(3, E.staticMethod5<int>(3));

  Expect.equals("42", E.e1.instanceMethod1());
  Expect.equals("X", E.e1.instanceMethod2("X"));
  Expect.equals(0, E.e1.instanceMethod3());
  Expect.equals(1, E.e1.instanceMethod3(1));
  Expect.isNull(E.e1.instanceMethod4());
  Expect.equals(2, E.e1.instanceMethod4(i: 2));
  Expect.equals(3, E.e1.instanceMethod5<int>(3));

  Expect.equals("42", Ext.staticMethod1());
  Expect.equals("X", Ext.staticMethod2("X"));
  Expect.equals(0, Ext.staticMethod3());
  Expect.equals(1, Ext.staticMethod3(1));
  Expect.equals(0, Ext.staticMethod4());
  Expect.equals(2, Ext.staticMethod4(i: 2));
  Expect.equals(3, Ext.staticMethod5<int>(3));

  Expect.equals("42", A().instanceMethod1());
  Expect.equals("X", A().instanceMethod2("X"));
  Expect.equals(0, A().instanceMethod3());
  Expect.equals(1, A().instanceMethod3(1));
  Expect.isNull(A().instanceMethod4());
  Expect.equals(2, A().instanceMethod4(i: 2));
  Expect.equals(3, A().instanceMethod5<int>(3));

  Expect.equals("42", ET.staticMethod1());
  Expect.equals("X", ET.staticMethod2("X"));
  Expect.equals(0, ET.staticMethod3());
  Expect.equals(1, ET.staticMethod3(1));
  Expect.equals(0, ET.staticMethod4());
  Expect.equals(2, ET.staticMethod4(i: 2));
  Expect.equals(3, ET.staticMethod5<int>(3));

  Expect.equals("42", ET(0).instanceMethod1());
  Expect.equals("X", ET(0).instanceMethod2("X"));
  Expect.equals(0, ET(0).instanceMethod3());
  Expect.equals(1, ET(0).instanceMethod3(1));
  Expect.isNull(ET(0).instanceMethod4());
  Expect.equals(2, ET(0).instanceMethod4(i: 2));
  Expect.equals(3, ET(0).instanceMethod5<int>(3));
}
