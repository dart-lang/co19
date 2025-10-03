// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of the
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test classes.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1(var int v) {
  C1.invalid(this.v); // Needed as redirection target for the constructor below
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C1(int v) : this.invalid(v);
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
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  const C3.someName(int v) : this(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5(var int v) {
  C5.foo(int v) : this(v);
  factory C5(int v) = C5.foo;
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

class C7.new(var int v) {
  C7.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C7(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8(var int v) {
  C8.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C8.new(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C9.new(var int v) {
  C9.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C9.new(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C10.new(var int v) {
  C10.foo(int v) : this(v);
  factory C10(int v) = C10.foo;
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C11(var int v) {
  C11.foo(int v) : this(v);
  factory C11.new(int v) = C11.foo;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C12.new(var int v) {
  C12.foo(int v) : this(v);
  factory C12.new(int v) = C12.foo;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C5);
  print(C6);
  print(C7);
  print(C8);
  print(C9);
  print(C10);
  print(C11);
  print(C12);
}
