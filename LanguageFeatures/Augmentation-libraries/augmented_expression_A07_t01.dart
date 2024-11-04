// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In all relevant cases, if the augmented member is an instance
/// member, it is invoked with the same value for `this`.
///
/// @description Checks that if the augmented member is an instance member, it
/// is invoked with the same value for `this`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A07_t01_lib.dart';

class C {
  C test() => this;
}

mixin M {
  M test() => this;
}

enum E {
  e0;
  E test() => this;
}

class A {}

extension Ext on A {
  A test() => this;
}

extension type ET(int _) {
  ET test() => this;
}

class MA = Object with M;

main() {
  C().test();
  MA().test();
  E.e0.test();
  A().test();
  ET(0).test();
}
