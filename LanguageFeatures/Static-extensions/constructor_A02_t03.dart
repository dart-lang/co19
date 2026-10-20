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

mixin M {}

extension ExtM1 on M {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM2 on M {
  M();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM3 on M {
  M._() {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM4 on M {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M);
}
