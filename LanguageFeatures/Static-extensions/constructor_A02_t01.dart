// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an extension declares a constructor
/// which is generative.
///
/// @description Checks that it is a compile-time error if an extension declares
/// a non-redirecting generative constructor. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C1 {
  C1.named();
}

extension ExtC1 on C1 {
  new();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2._();

extension ExtC2 on C2 {
  new() : this._();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3.named() {}

extension ExtC3 on C3 {
  const new();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4.named() {}

extension ExtC4 on C4 {
  new() {}
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
