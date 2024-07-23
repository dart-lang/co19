// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting function declaration may have an empty body (`;`)
/// in order to only augment the metadata or doc comments of the function. In
/// this case the body of the augmented member is not altered.
///
/// @description Checks that if an augmenting function declaration has an empty
/// body then the body of the augmented member is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A07_t01_lib.dart';
import '../../Utils/expect.dart';

String topLevelFunction() => "Original"

class C {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

mixin M {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

enum E {
  e1;
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

class A {}

extension Ext on A {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

extension type ET(int _) {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Original", topLevelFunction());
  Expect.equals("Original", C.staticMethod());
  Expect.equals("Original", C().instanceMethod());
  Expect.equals("Original", M.staticMethod());
  Expect.equals("Original", MA().instanceMethod());
  Expect.equals("Original", E.staticMethod());
  Expect.equals("Original", E.e1.instanceMethod());
  Expect.equals("Original", Ext.staticMethod());
  Expect.equals("Original", A().instanceMethod());
  Expect.equals("Original", ET.staticMethod());
  Expect.equals("Original", ET(0).instanceMethod());
}
