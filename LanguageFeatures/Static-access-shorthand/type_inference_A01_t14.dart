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
/// declaration `D`. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

extension type ET<T>(T value) {
  ET.id(this.value);
  factory ET.f(T t) = ET;

  static ET<int> get staticGetter => ET(4);
  static ET<X> staticMethod<X>(X x) => ET<X>(x);
  static ET<String> instance = ET("one");
}

main() {
  ET? et1 = .new(1);
  Expect.equals(1, et1.value);

  ET<int>? et2 = .id(2);
  Expect.equals(2, et2.value);

  ET? et3 = .f(3);
  Expect.equals(3, et3.value);

  ET<int>? et4 = .staticGetter;
  Expect.equals(4, et4.value);

  ET<int>? et5 = .staticMethod<int>(5);
  Expect.equals(5, et5.value);

  ET<String>? et6 = ET.instance;
  Expect.equals("one", et6.value);
}
