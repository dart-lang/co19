// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of an in-body
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type ET1 {
  this(final int v);
  ET1(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2 {
  this(final int v);
  ET2.new(this.v);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3 {
  this.new(final int v);
  ET3(this.v);
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4 {
  this.new(final int v);
  ET4.new(this.v);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5 {
  this(final int v);
  ET.foo(int v) : this(v);
  factory ET5(int v) = ET5.foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6 {
  this.new(final int v);
  ET6.foo(int v) : this(v);
  factory ET6(int v) = ET6.foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7 {
  this(final int v);
  ET7.foo(this.v);
  factory ET7.new(int v) => ET7.foo(v);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET8 {
  this.new(final int v);
  ET8.foo(this.v);
  factory ET8.new(int v) => ET8.foo(v);
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
  print(ET8);
}
