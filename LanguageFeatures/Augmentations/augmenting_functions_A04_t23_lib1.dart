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
/// @description Checks that it is a compile-time error if the return type of an
/// augmentation don't exactly match the original function. Test the case when
/// the return type is a top type.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'augmenting_functions_A04_t23.dart';

augment void topLevelFunction1();
//           ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment Object? topLevelFunction2();
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment dynamic topLevelFunction3();
//              ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod1();
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1();
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod1();
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1();
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment static void staticMethod1();
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1();
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod1();
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1();
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void staticMethod1();
//                    ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static Object? staticMethod2();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static dynamic staticMethod3();
//                       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment void instanceMethod1();
//             ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment Object? instanceMethod2();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment dynamic instanceMethod3();
//                ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
