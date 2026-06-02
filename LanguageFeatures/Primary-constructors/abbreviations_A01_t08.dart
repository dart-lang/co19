// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that it is a compile-time error to declare the primary
/// constructor named `name` and the one named `new name`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C.name() {
  new name() : this.name();
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E.name() {
  e0.name();

  const new name() : this.name();
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET.name(int v) {
  new name(this.v);
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
