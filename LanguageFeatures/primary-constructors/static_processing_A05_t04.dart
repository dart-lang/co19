// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the name of the primary
/// constructor is the same as the name of a constructor (declaring or not) in
/// the body.
///
/// @description Check that it is a compile-time error if the name of an in-body
/// declaring constructor is the same as the name of some constructor declared
/// in the body. Test classes.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1 {
  this(var int v);
  C1.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C1(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  this(var int v2);
  C2.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C2.new(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 {
  this.new(var int v);
  C3.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C3(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 {
  this.new(var int v);
  C4.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C4(int v) : this.invalid(v);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5 {
  this.new(var int v);
  C5.invalid(this.v);
//^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C5.new(int v) : this.invalid(v);
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 {
  const this.someName(final int v);
  const C6(this.v);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
  const C6.someName(int v) : this(v);
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C7 {
  C7(var int v);
  C7.foo(int v) : this(v);
  factory C7(int v) = C7.foo;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C8 {
  C8(var int v);
  C8.foo(int v) : this(v);
  factory C8.new(int v) = C8.foo;
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C9 {
  C9.new(var int v);
  C9.foo(int v) : this(v);
  factory C9(int v) = C9.foo;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C10 {
  C10.new(var int v);
  C10.foo(int v) : this(v);
  factory C10(int v) = C10.foo;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C11 {
  this.someName(final int v);
  C11(this.v);
  factory C11.someName(int v) => C11(v);
//        ^^^^^^^^^^^^
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
}
