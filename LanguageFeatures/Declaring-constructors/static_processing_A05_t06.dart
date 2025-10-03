// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of an in-body
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test enums.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

enum E1 {
  e0(1);

  const this(final int v);
  const E1.foo(this.v);
  const E1(int v) : this.foo(v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0(2);

  const this.new(final int v);
  const E1.foo(this.v);
  const E2(int v) : this.invalid(v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0(3);

  const this(final int v);
  const E3.foo(this.v);
  const E3.new(int v) : this.foo(v);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4 {
  e0(4);

  const this.new(final int v);
  const E4.foo(this.v);
  const E4.new(int v) : this.foo(v);
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E5 {
  e0(5);
  const this.someName(final int v);
  const E4.foo(this.v);
  const E5.someName(int v) : this.foo(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
}
