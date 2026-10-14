// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to declare a constructor in an
/// extension whose on-type is not regular-bounded, assuming that the type
/// arguments substituted for the type parameters declared by the extension
/// satisfy the bounds on the parameters.
///
/// @description Checks that it is a compile-time error to declare a redirecting
/// factory constructor in an extension whose on-type is not regular-bounded.
/// Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<X extends C<X>> {
  C.named();
}

extension Ext1 on C<dynamic> {
  factory foo() = C.named;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext2 on C<void> {
  factory() = C.named;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext3 on C<Object?> {
  factory foo() = C.named;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A<T extends A<T, S>, S extends A<T, S>> {
  A.named();
}

extension Ext4 on A<dynamic, dynamic> {
  factory foo() = A.named;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension Ext5 on A<Object?, void> {
  factory() = A.named;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(A);
}
