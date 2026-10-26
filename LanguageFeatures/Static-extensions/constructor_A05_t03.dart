// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If an extension declaration is generic, the type parameters
/// declared by the extension are in scope in any constructors declared in the
/// extension (just as with a constructor declared in a generic class).
///
/// @description Checks that the type parameters declared by an extension are in
/// scope in a non-redirecting factory constructor declared in the extension.
/// Test that it is a compile-time error to assign a value of a type which is
/// not a subtype of the type parameter to a variable of that type, and also
/// that a returned expression has a subtype of the uninstantiated on-type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class C<T> {
  C();
}

mixin M<T> {}

class MO<T> = Object with M<T>;

mixin class MC<T> {}

extension type ET<T>(int _) {}

extension ExtC<T> on C<T> {
  factory foo() {
    T x = 1;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return C<T>();
  }

  factory bar() => C<String>();
//                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtM<T> on M<T> {
  factory foo() {
    T x = 1;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return MO<T>();
  }

  factory bar() => MO<String>();
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtMC<T> on MC<T> {
  factory foo() {
    T x = 1;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return MC<T>();
  }

  factory bar() => MC<String>();
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension ExtET<T> on ET<T> {
  factory foo() {
    T x = 1;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return ET<T>(1);
  }

  factory bar() => ET<String>(1);
//                 ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(MC);
  print(ET);
}
