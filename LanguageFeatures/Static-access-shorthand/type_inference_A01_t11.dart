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
/// forms `FutureOr<C>`, `FutureOr<C<...>>`, `FutureOr<C>?`,
/// `FutureOr<C<...>>?`, `FutureOr<C?>`, `FutureOr<C<...>?>`, `FutureOr<C?>?` or
/// `FutureOr<C<...>?>?` and `C` is a type introduced by the type declaration
/// `D`, then the shorthand context denotes the type declaration `D`. Test a
/// mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

class C<T> {
  T value;
  C(this.value);
}

mixin M<T> on C<T> {
  static M<int> get staticGetter => MC(1);
  static M<X> staticMethod<X>(X x) => MC<X>(x);
  static M<String> instance = MC("one");

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return value == other.value;
    }
    return false;
  }
}

class MC<T> = C<T> with M<T>;

main() async {
  FutureOr<M<int>?>? m1 = .staticGetter;
  Expect.equals(MC(1), await m1);

  FutureOr<M<int>?>? m2 = .staticMethod<int>(2);
  Expect.equals(MC(2), await m2);

  FutureOr<M<String>?>? m3 = .instance;
  Expect.equals(MC("one"), await m3);
}
