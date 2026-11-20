// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance creation expression of any of the following forms is
/// considered to be a reference to `name`:
/// - `C<TypeArguments>.name(arguments)` where `<TypeArguments>` may be absent
///   and where `name` may be `new`.
/// - `C<TypeArguments>(arguments)` where `<TypeArguments>` may be absent and
///   where `name` is considered to be `new`.
///
/// Similarly a constructor tearoff of any of the following forms is considered
/// to be a reference to `name`:
/// - `C<TypeArguments>.name` where `<TypeArguments>` may be absent and where
///   `name` may be `new`.
/// - `C<TypeArguments>` where `<TypeArguments>` may be absent and where `name`
///   is considered to be `new`.
///
/// In any of these cases, assume that `C` denotes a type introducing membered
/// declaration `D` (where `C` may include an import prefix). Assume that `D`
/// does not declare a constructor with uniform base constructor name `name`.
///
/// @description Checks that if an enum `E` declares a constructor with uniform
/// base constructor name `name`, then `E.name(arguments)`, `E(arguments)` and
/// the corresponding tearoffs refer to that constructor and not to a
/// constructor declared in an extension, which is a compile-time error.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

enum E<X> {
  e0<int>.named(),
  e1<String>();

  const E();
  const E.named();
}

extension ExtE<T> on E<T> {
  factory named() => E.e0 as E<T>;
  factory() => E.e1 as E<T>;
}

main() {
  E.named();
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named();
//^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E();
//^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.new();
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E<int>.named;
//^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.new;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
