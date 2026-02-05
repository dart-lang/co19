// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A context type scheme is said to denote a declaration in some
/// cases. Not all context type schemes denote a declaration.
/// If a type scheme `S`:
/// - has the form `C` or `C<typeArgs>` where `C` is a type introduced by a
///   declaration `D` which must therefore be a type-introducing declaration,
///   which currently means a class, mixin, enum or extension type declaration,
///   then `S` denotes the declaration `D`.
/// - has the form `S?` or `FutureOr<S>`, and the type scheme S denotes a
///   declaration D, then so does `S?/FutureOr<S>`. Only the "base type" of the
///   union type is considered, ensuring that a type scheme denotes at most one
///   declaration or static namespace.
/// - has any other form, including type variables, promoted type variables and
///   `_`, then the type scheme does not denote any declaration or namespace.
///
/// @description Checks that it is a compile-time error if expressions of the
/// forms `.id`, `.id(args)`, `.id<typeArgs>(args)` or `.new(args)` tries to
/// access an unavailable extension type.
/// @author sgrekhov22@gmail.com
/// @issue 62504

// SharedOptions=--enable-experiment=dot-shorthands

import 'type_inference_A09_lib.dart';

main() {
  etContextProvider(.new(1));
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.foo(2));
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.bar(3));
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.baz(4));
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.staticGetter);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.staticMethod());
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.staticMethod<int>());
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  etContextProvider(.instances[0]);
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
