// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting setter declaration may have an empty body (`;`) in
/// order to only augment the metadata or doc comments of the setter. In this
/// case the body of the augmented setter is not altered.
///
/// @description Checks that if an augmenting setter has no body then the body
/// of the augmented setter is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_setters_A02_t01_lib.dart';

String _log = "";

void set topLevelSetter(int v) {
  _log = "Original = $v;";
}

class C {
  static void set staticSetter(int v) {
    _log = "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log = "Original = $v;";
  }
}

mixin M {
  static void set staticSetter(int v) {
    _log = "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log = "Original = $v;";
  }
}

enum E {
  e0;
  static void set staticSetter(int v) {
    _log = "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log = "Original = $v;";
  }
}

class A {}

extension Ext on A {
  static void set staticSetter(int v) {
    _log = "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log = "Original = $v;";
  }
}

extension type ET(int _) {
  static void set staticSetter(int v) {
    _log = "Original = $v;";
  }
  void set instanceSetter(int v) {
    _log = "Original = $v;";
  }
}

class MA = Object with M;

main() {
  topLevelSetter = 1;
  Expect.equals("Original = 1;", _log);
  C.staticSetter = 1;
  Expect.equals("Original = 1", _log);
  C().instanceSetter = 1;
  Expect.equals("Original", _log);
  M.staticSetter = 1;
  Expect.equals("Original = 1", _log);
  MA().instanceSetter = 1;
  Expect.equals("Original", _log);
  E.staticSetter = 1;
  Expect.equals("Original = 1", _log);
  E.e0.instanceSetter = 1;
  Expect.equals("Original", _log);
  Ext.staticSetter = 1;
  Expect.equals("Original = 1", _log);
  A().instanceSetter = 1;
  Expect.equals("Original", _log);
  ET.staticSetter = 1;
  Expect.equals("Original = 1", _log);
  ET(0).instanceSetter = 1;
  Expect.equals("Original", _log);
}
