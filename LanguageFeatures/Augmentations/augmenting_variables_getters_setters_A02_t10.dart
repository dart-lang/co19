// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// - For all positional parameters:
///   - The augmenting function's parameter name is `_`, or
///   - The augmenting function's parameter name is the same as the name of the
///     corresponding positional parameter in every preceding declaration that
//      doesn't have `_` as its name.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting getter or setter does not match the
///   signature of the corresponding introductory getter or setter.
///
/// @description Checks that it is not an error if the parameter name of an
/// introductory declaration is `_` and the name in an augmentation is not `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int log = -1;

void set topLevelSetter1(int _);
augment void set topLevelSetter1(int x) {
  log = x;
}
augment void set topLevelSetter1(int _);
augment void set topLevelSetter1(int x);

void set topLevelSetter2(int _) {}
augment void set topLevelSetter1(int _x);
augment void set topLevelSetter1(int _);
augment void set topLevelSetter1(int _x);

class C {
  static void set staticSetter1(int _);
  augment static void set staticSetter1(int x) {
    log = x;
  }
  augment static void set staticSetter1(int _);
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int _) {}
  augment static void set staticSetter2(int _x);
  augment static void set staticSetter2(int _);
  augment static void set staticSetter2(int _x);

  void set instanceSetter1(int _);
  augment void set instanceSetter1(int x) {
    log = x;
  }
  augment void set instanceSetter1(int _);
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int _) {}
  augment void set instanceSetter2(int _x);
  augment void set instanceSetter2(int _);
  augment void set instanceSetter2(int _x);
}

mixin M {
  static void set staticSetter1(int _);
  augment static void set staticSetter1(int x) {
    log = x;
  }
  augment static void set staticSetter1(int _);
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int _) {}
  augment static void set staticSetter2(int _x);
  augment static void set staticSetter2(int _);
  augment static void set staticSetter2(int _x);

  void set instanceSetter1(int _);
  augment void set instanceSetter1(int x) {
    log = x;
  }
  augment void set instanceSetter1(int _);
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int _) {}
  augment void set instanceSetter2(int _x);
  augment void set instanceSetter2(int _);
  augment void set instanceSetter2(int _x);
}

enum E {
  e0;
  static void set staticSetter1(int _);
  augment static void set staticSetter1(int x) {
    log = x;
  }
  augment static void set staticSetter1(int _);
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int _) {}
  augment static void set staticSetter2(int _x);
  augment static void set staticSetter2(int _);
  augment static void set staticSetter2(int _x);

  void set instanceSetter1(int _);
  augment void set instanceSetter1(int x) {
    log = x;
  }
  augment void set instanceSetter1(int _);
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int _) {}
  augment void set instanceSetter2(int _x);
  augment void set instanceSetter2(int _);
  augment void set instanceSetter2(int _x);
}

class A {}

extension Ext on A {
  static void set staticSetter1(int _);
  augment static void set staticSetter1(int x) {
    log = x;
  }
  augment static void set staticSetter1(int _);
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int _) {}
  augment static void set staticSetter2(int _x);
  augment static void set staticSetter2(int _);
  augment static void set staticSetter2(int _x);

  void set instanceSetter1(int _);
  augment void set instanceSetter1(int x) {
    log = x;
  }
  augment void set instanceSetter1(int _);
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int _) {}
  augment void set instanceSetter2(int _x);
  augment void set instanceSetter2(int _);
  augment void set instanceSetter2(int _x);
}

extension type ET(int _) {
  static void set staticSetter1(int _);
  augment static void set staticSetter1(int x) {
    log = x;
  }
  augment static void set staticSetter1(int _);
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int _) {}
  augment static void set staticSetter2(int _x);
  augment static void set staticSetter2(int _);
  augment static void set staticSetter2(int _x);

  void set instanceSetter1(int _);
  augment void set instanceSetter1(int x) {
    log = x;
  }
  augment void set instanceSetter1(int _);
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int _) {}
  augment void set instanceSetter2(int _x);
  augment void set instanceSetter2(int _);
  augment void set instanceSetter2(int _x);
}

class MA = Object with M;

main() {
  topLevelSetter1 = 1;
  topLevelSetter2 = 2;
  Expect.equals(1, log);

  C.staticSetter1 = 3;
  C.staticSetter2 = 4;
  Expect.equals(3, log);
  C().instanceSetter1 = 5;
  C().instanceSetter2 = 6;
  Expect.equals(5, log);

  M.staticSetter1 = 7;
  M.staticSetter2 = 8;
  Expect.equals(7, log);
  MA().instanceSetter1 = 9;
  MA().instanceSetter2 = 10;
  Expect.equals(9, log);

  E.staticSetter1 = 11;
  E.staticSetter2 = 12;
  Expect.equals(11, log);
  E.e0.instanceSetter1 = 13;
  E.e0.instanceSetter2 = 14;
  Expect.equals(13, log);

  Ext.staticSetter1 = 15;
  Ext.staticSetter2 = 16;
  Expect.equals(15, log);
  A().instanceSetter1 = 17;
  A().instanceSetter2 = 18;
  Expect.equals(17, log);

  ET.staticSetter1 = 19;
  ET.staticSetter2 = 20;
  Expect.equals(19, log);
  ET(0).instanceSetter1 = 21;
  ET(0).instanceSetter2 = 22;
  Expect.equals(21, log);
}
