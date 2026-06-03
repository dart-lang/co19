// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is a compile-time error to declare both the
/// primary constructor named after the class and a constructor declared using
/// the `new` keyword.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C() {
  new() : this();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E() {
  e0;

  const new() : this();
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  new(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
