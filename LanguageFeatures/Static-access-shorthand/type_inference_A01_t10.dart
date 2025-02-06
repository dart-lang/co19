// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if a shorthand context type schema has one of the
/// forms `C`, `C<...>`, `C?`, or `C<...>?` and `C` is a type introduced by the
/// type declaration `D`, then the shorthand context denotes the type
/// declaration `D`. Test a mixin.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

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

main() {
  M<int>? m1 = .staticGetter;
  Expect.equals(MC(1), m1);

  M? m2 = .staticGetter;
  Expect.equals(MC(1), m2);

  M<int>? m3 = .staticMethod<int>(3);
  Expect.equals(MC(3), m3);

  M? m4 = .staticMethod<int>(4);
  Expect.equals(MC(4), m4);

  M<String>? m5 = .instance;
  Expect.equals(MC("one"), m5);

  M? m6 = .instance;
  Expect.equals(MC("one"), m6);
}
