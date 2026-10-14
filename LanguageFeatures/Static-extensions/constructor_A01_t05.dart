// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to declare a constructor in an
/// extension whose on-type is not regular-bounded, assuming that the type
/// arguments substituted for the type parameters declared by the extension
/// satisfy the bounds on the parameters.
///
/// @description Checks that it is a compile-time error to declare a
/// non-redirecting factory constructor in an extension whose on-type is not
/// regular-bounded. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E<X extends num> {
  e0.bar();

  E.bar();
}

extension Ext1 on E<dynamic> {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on E<void> {
  factory() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3 on E<Object?> {
  factory foo() => throw 0;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
