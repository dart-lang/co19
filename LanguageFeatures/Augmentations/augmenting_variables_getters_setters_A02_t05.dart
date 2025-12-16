// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// - The signature of the augmenting getter or setter does not match the
///   signature of the augmented getter or setter.
///
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation doesn't exactly match the original implicit getter. Test
/// implicit dynamic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

var topLevelGetter1;
augment int get topLevelGetter1;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified

var topLevelGetter2;
augment Object? get topLevelGetter2;
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static var staticGetter1;
  augment static int get staticGetter1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticGetter2;
  augment static Object? get staticGetter2;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter1;
  augment int get instanceGetter1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter2;
  augment Object? get instanceGetter2;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static var staticGetter1;
  augment static int get staticGetter1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticGetter2;
  augment static Object? get staticGetter2;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter1;
  augment int get instanceGetter1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter2;
  augment Object? get instanceGetter2;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static var staticGetter1;
  augment static int get staticGetter1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticGetter2;
  augment static Object? get staticGetter2;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter1;
  augment int get instanceGetter1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter2;
  augment Object? get instanceGetter2;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static var staticGetter1;
  augment static int get staticGetter1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticGetter2;
  augment static Object? get staticGetter2;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter1;
  augment int get instanceGetter1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter2;
  augment Object? get instanceGetter2;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static var staticGetter1;
  augment static int get staticGetter1;
//               ^^^
// [analyzer] unspecified
// [cfe] unspecified

  static var staticGetter2;
  augment static Object? get staticGetter2;
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter1;
  augment int get instanceGetter1;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  var instanceGetter2;
  augment Object? get instanceGetter2;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

testStaticType([C? c, M? m, A? a, ET? et]) {
  topLevelGetter1.testDynamic;
  topLevelGetter2.testDynamic;
  C.staticGetter1.testDynamic;
  C.staticGetter2.testDynamic;
  c!.instanceGetter1.testDynamic;
  c.instanceGetter2.testDynamic;
  M.staticGetter1.testDynamic;
  M.staticGetter2.testDynamic;
  m!.instanceGetter1.testDynamic;
  m.instanceGetter2.testDynamic;
  E.staticGetter1.testDynamic;
  E.staticGetter2.testDynamic;
  E.e0.instanceGetter1.testDynamic;
  E.e0.instanceGetter2.testDynamic;
  Ext.staticGetter1.testDynamic;
  Ext.staticGetter2.testDynamic;
  a!.instanceGetter1.testDynamic;
  a.instanceGetter2.testDynamic;
  ET.staticGetter1.testDynamic;
  ET.staticGetter2.testDynamic;
  et!.instanceGetter1.testDynamic;
  et.instanceGetter2.testDynamic;
}

main() {
  if (1 > 2) {
    test();
  }
}
