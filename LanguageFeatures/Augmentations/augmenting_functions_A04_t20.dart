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
/// @description Checks that it is not an error if a `required` modifier of
/// named parameters of an augmentation exactly matches the original function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int topLevelFunction({required int i}) => i;

augment int topLevelFunction({required int i});

class C {
  static int staticMethod({required int i}) => i;
  int instanceMethod({required int i}) => i;
}

augment class C {
  augment static int staticMethod({required int i});
  augment int instanceMethod({required int i});
}


mixin M {
  static int staticMethod({required int i}) => i;
  int instanceMethod({required int i}) => i;
}

augment mixin M {
  augment static int staticMethod({required int i});
  augment int instanceMethod({required int i});
}

enum E {
  e1;
  static int staticMethod({required int i}) => i;
  int instanceMethod({required int i}) => i;
}

augment enum E {
  ;
  static int staticMethod({required int i});
  int instanceMethod({required int i});
}

class A {}

extension Ext on A {
  static int staticMethod({required int i}) => i;
  int instanceMethod({required int i}) => i;
}

augment extension Ext {
  augment static int staticMethod({required int i});
  augment int instanceMethod({required int i});
}

extension type ET(int _) {
  static int staticMethod({required int i}) => i;
  int instanceMethod({required int i}) => i;
}

augment extension type ET {
  augment static int staticMethod({required int i});
  augment int instanceMethod({required int i});
}

class MA = Object with M;

main() {
  Expect.equals(1, topLevelFunction(i: 1));
  Expect.equals(2, C.staticMethod(i: 2));
  Expect.equals(3, C().instanceMethod(i: 3));
  Expect.equals(4, M.staticMethod(i: 4));
  Expect.equals(5, MA().instanceMethod(i: 5));
  Expect.equals(6, E.staticMethod(i: 6));
  Expect.equals(7, E.e1.instanceMethod(i: 7));
  Expect.equals(8, Ext.staticMethod(i: 8));
  Expect.equals(9, A().instanceMethod(i: 9));
  Expect.equals(10, ET.staticMethod(i: 10));
  Expect.equals(11, ET(0).instanceMethod(i: 11));
}
