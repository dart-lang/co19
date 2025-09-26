// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of the
/// primary constructor is the same as the name of some constructor declared in
/// the body. Test classes.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1(var int v) {
  C1.someName(this.v);
  C1(int v) : this.someName(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2(int v1) {
  this(var int v2);
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class const C3.someName(final int v) {
  const C3(this.v);
  const C3.someName(int v) : this(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4.someName(int v1) {
  this.someName(var int v2);
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5(var int v) {
  C5.someName(int v) : this(v);
  factory C5(int v) = C5.someName;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 {
  this.someName(final int v);
  C6(this.v);
  factory C6.someName(int v) => C6(v);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
}
