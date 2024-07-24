// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting getter declaration may have an empty body (`;`) in
/// order to only augment the metadata or doc comments of the getter. In this
/// case the body of the augmented getter is not altered.
///
/// @description Checks that if an augmenting getter has no body then the body
/// of the augmented getter is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_getters_A02_t01_lib.dart';
import '../../Utils/expect.dart';

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

enum E {
  e0;
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

extension type ET(int _) {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Original", topLevelGetter);
  Expect.equals("Original", C.staticGetter);
  Expect.equals("Original", C().instanceGetter);
  Expect.equals("Original", M.staticGetter);
  Expect.equals("Original", MA().instanceGetter);
  Expect.equals("Original", E.staticGetter);
  Expect.equals("Original", E.e0.instanceGetter);
  Expect.equals("Original", Ext.staticGetter);
  Expect.equals("Original", A().instanceGetter);
  Expect.equals("Original", ET.staticGetter);
  Expect.equals("Original", ET(0).instanceGetter);
}
