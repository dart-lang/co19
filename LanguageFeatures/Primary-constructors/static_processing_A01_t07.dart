// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that it is a compile-time error if a keyword `factory` is
/// used to declare a constant non-redirecting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C {
  int v;
  const C.create(this.v);

  const factory C() => C.create(1);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type const ET(int _) {
  const factory() => ET(0);
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
