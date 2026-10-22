// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test a mixin class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

mixin class MC1.named() {}

extension ExtMC1 on MC1 {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC2.named() {}

extension Ext1MC2 on MC2 {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC3 {
  MC3.named();
}

extension ExtMC3 on MC3 {
  new() : this.named();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC4.named() {}

extension ExtMC4 on MC4 {
  new() {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(MC1);
  print(MC2);
  print(MC3);
  print(MC4);
}
