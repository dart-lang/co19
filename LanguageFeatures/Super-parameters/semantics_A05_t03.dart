// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a constructor has a named
/// super-parameter with name n and a super-constructor invocation with a named
/// argument with name n.
///
/// @description Check that it is a compile-time error if a declaring
/// constructor has a named super-parameter with name `n` and a
/// super-constructor invocation with a named argument with name `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class S {
  int? n;
  S({int? n}) : this.n = n;
}

class C1({super.n}) extends S {
  this : super(n: 42);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2.someName({super.n}) extends S {
  this.someName : super(n: 42);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3({required super.n}) extends S {
  this : super(n: 42);
//       ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4 extends S {
  this({super.n}) : super(n: 42);
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5.someName({super.n}) extends S {
  this.someName : super(n: 42);
//                ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6 extends S {
  this({required super.n}) : super(n: 42);
//                           ^^^^^
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
