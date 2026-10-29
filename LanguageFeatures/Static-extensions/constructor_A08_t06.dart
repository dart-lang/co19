// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a redirecting factory constructor
/// declared in an extension has a redirection target which is not a subtype of
/// the un-instantiated on-type of the extension (after inference has been
/// performed).
///
/// In addition, all of the usual compile-time errors associated with
/// declarations of redirecting factory constructors continue to apply.
///
/// @description Checks that it is a compile-time error if a redirecting factory
/// constructor declared in an extension is part of a redirection cycle.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {}

mixin M<T> {}

mixin class MC<T> {}

extension type ET<T>(int _) {}

enum E<T> {
  e0;
}

extension ExtC<T> on C<T> {
  factory foo() = C<T>.foo;
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar1() = C<T>.bar2;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar2() = C<T>.bar1;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory baz1() = C<T>.baz2;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtC2<T> on C<T> {
  factory baz2() = C<T>.baz1;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo() = M<T>.foo;
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar1() = M<T>.bar2;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar2() = M<T>.bar1;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo() = MC<T>.foo;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar1() = MC<T>.bar2;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar2() = MC<T>.bar1;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo() = ET<T>.foo;
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar1() = ET<T>.bar2;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar2() = ET<T>.bar1;
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtE<T> on E<T> {
  factory foo() = E<T>.foo;
//                ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar1() = E<T>.bar2;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory bar2() = E<T>.bar1;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
  print(E);
}
