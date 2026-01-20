// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is not omitted,
/// then it's a compile-time error if the type denoted by the augmenting
/// declaration is not the same type as the type in the corresponding
/// declaration being augmented.
///
/// @description Check that it is no error if an augmenting declaration
/// specifies the same formal parameter type as the introductory declaration
/// does. Test setters and implicit `dynamic` (for functions see
/// `augmenting_functions_A04_t22.dart`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

void set topLevelSetter(v) {
  if (1 > 2) {
    v.memberThatDoesNotExist;
  }
}

augment void set topLevelSetter(dynamic v);

class C {
  static void set staticSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
  void set instanceSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
}

augment class C {
  augment static void set staticSetter(dynamic v);
  augment void set instanceSetter(dynamic v);
}

mixin M {
  static void set staticSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
  void set instanceSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
}

augment mixin M {
  augment static void set staticSetter(dynamic v);
  augment void set instanceSetter(dynamic v);
}

enum E {
  e0;
  static void set staticSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
  void set instanceSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
}

augment enum E {
  ;
  augment static void set staticSetter(dynamic v);
  augment void set instanceSetter(dynamic v);
}

class A {}

extension Ext on A {
  static void set staticSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
  void set instanceSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
}

augment extension Ext {
  augment static void set staticSetter(dynamic v);
  augment void set instanceSetter(dynamic v);
}

extension type ET(int id) {
  static void set staticSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
  void set instanceSetter(v) {
    if (1 > 2) {
      v.memberThatDoesNotExist;
    }
  }
}

augment extension type ET {
  augment static void set staticSetter(dynamic v);
  augment void set instanceSetter(dynamic v);
}

class MA = Object with M;

main() {
  topLevelSetter = "x";
  C.staticSetter = "x";
  C().instanceSetter = "x";
  M.staticSetter = "x";
  MA().instanceSetter = "x";
  E.staticSetter = "x";
  E.e0.instanceSetter = "x";
  Ext.staticSetter = "x";
  A().instanceSetter = "x";
  ET.staticSetter = "x";
  ET(0).instanceSetter = "x";
}
