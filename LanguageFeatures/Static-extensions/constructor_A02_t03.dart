// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

mixin M1 {}

extension ExtM1 on M1 {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M2 {}

extension ExtM2 on M2 {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M3 {}

extension ExtM3 on M3 {
  new() {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
}
