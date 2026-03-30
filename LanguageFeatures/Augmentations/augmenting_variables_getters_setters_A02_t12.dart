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
/// In a declaration where a parameter named `n` is declared using `_`, the name
/// `n` is not in scope and may be resolved elsewhere.
///
/// @description Checks that in a declaration where a parameter named `n` is
/// declared using `_`, the name `n` is not in scope and may be resolved
/// elsewhere.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

int x = 42;
int log = -1;

void set topLevelSetter1(int _) {
  log = x;
}
augment void set topLevelSetter1(int x);

void set topLevelSetter2(int x);
augment void set topLevelSetter2(int _) {
  log = x;
}

class C {
  static void set staticSetter1(int _) {
    log = x;
  }
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int x);
  augment static void set staticSetter2(int _) {
    log = x;
  }

  void set instanceSetter1(int _) {
    log = x;
  }
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int x);
  augment void set instanceSetter2(int _) {
    log = x;
  }
}

mixin M {
  static void set staticSetter1(int _) {
    log = x;
  }
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int x);
  augment static void set staticSetter2(int _) {
    log = x;
  }

  void set instanceSetter1(int _) {
    log = x;
  }
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int x);
  augment void set instanceSetter2(int _) {
    log = x;
  }
}

enum E {
  e0;
  static void set staticSetter1(int _) {
    log = x;
  }
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int x);
  augment static void set staticSetter2(int _) {
    log = x;
  }

  void set instanceSetter1(int _) {
    log = x;
  }
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int x);
  augment void set instanceSetter2(int _) {
    log = x;
  }
}

class A {}

extension Ext on A {
  static void set staticSetter1(int _) {
    log = x;
  }
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int x);
  augment static void set staticSetter2(int _) {
    log = x;
  }

  void set instanceSetter1(int _) {
    log = x;
  }
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int x);
  augment void set instanceSetter2(int _) {
    log = x;
  }
}

extension type ET(int _) {
  static void set staticSetter1(int _) {
    log = x;
  }
  augment static void set staticSetter1(int x);

  static void set staticSetter2(int x);
  augment static void set staticSetter2(int _) {
    log = x;
  }

  void set instanceSetter1(int _) {
    log = x;
  }
  augment void set instanceSetter1(int x);

  void set instanceSetter2(int x);
  augment void set instanceSetter2(int _) {
    log = x;
  }
}

class MA = Object with M;

checkLog() {
  Expect.equals(42, log);
  log = -1;
}

main() {
  topLevelSetter1 = 1;
  checkLog();
  topLevelSetter2 = 2;
  checkLog();

  C.staticSetter1 = 1;
  checkLog();
  C.staticSetter2 = 2;
  checkLog();
  C().instanceSetter1 = 1;
  checkLog();
  C().instanceSetter2 = 2;
  checkLog();

  M.staticSetter1 = 1;
  checkLog();
  M.staticSetter2 = 2;
  checkLog();
  MA().instanceSetter1 = 1;
  checkLog();
  MA().instanceSetter2 = 2;
  checkLog();

  E.staticSetter1 = 1;
  checkLog();
  E.staticSetter2 = 2;
  checkLog();
  E.e0.instanceSetter1 = 1;
  checkLog();
  E.e0.instanceSetter2 = 2;
  checkLog();

  Ext.staticSetter1 = 1;
  checkLog();
  Ext.staticSetter2 = 2;
  checkLog();
  A().instanceSetter1 = 1;
  checkLog();
  A().instanceSetter2 = 2;
  checkLog();

  ET.staticSetter1 = 1;
  checkLog();
  ET.staticSetter2 = 2;
  checkLog();
  ET(0).instanceSetter1 = 1;
  checkLog();
  ET(0).instanceSetter2 = 2;
  checkLog();
}
