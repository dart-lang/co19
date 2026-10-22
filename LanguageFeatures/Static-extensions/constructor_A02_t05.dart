// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a generative constructor. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E1 {
  e0.named();

  E1.named();
}

extension ExtE1 on E1 {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0.named();

  E2.named();
}

extension ExtE2 on E2 {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0.named();

  E3.named();
}

extension ExtE3 on E3 {
  new() : this.named();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
