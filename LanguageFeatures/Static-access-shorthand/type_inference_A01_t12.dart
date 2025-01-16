// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declaration denoted by a type scheme A context type scheme is
/// said to denote a declaration in some cases. Not all context type schemes
/// denote a declaration.
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
/// @description Checks that if a shorthand context type schema has one of the
/// forms `C`, `C<...>`, `C?`, or `C<...>?` and `C` is a type introduced by the
/// type declaration `D`, then the shorthand context denotes the type
/// declaration `D`. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

enum E<T> {
  e1(1), e2(2), e3("3"), e4("4");
  final T value;
  const E(this.value);

  static E<int> get staticGetter => E.e1;
  static E staticMethod() => E.e2;
  static E<String> instance = E.e3;
}

main() {
  E<int>? e1 = .staticGetter;
  Expect.equals(E.e1, e1);

  E? e2 = .staticMethod();
  Expect.equals(E.e2, e2);

  E<String>? e3 = .instance;
  Expect.equals(E.e3, e3);

  E<String>? e4 = .e4;
  Expect.equals(E.e4, e4);
}
