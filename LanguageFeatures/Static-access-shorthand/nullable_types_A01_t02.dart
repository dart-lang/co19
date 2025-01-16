// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a conspicuous special-casing to allow `int?` to denote a
/// static namespace, but it’s special casing of a type that we otherwise
/// special-case all the time.
///
/// It allows `int? v = .tryParse(42);` to work. That’s a pretty good reason. It
/// also allows `int x = .tryParse(input) ?? 0;` to work, which it wouldn’t
/// otherwise because the context type of `.tryParse(input)` is `int?`.
///
/// @description Checks that static access shorthand can be used with nullable
/// union types. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

class C<T> {
  T value;
  C(this.value);
  C.id(this.value);
  factory C.f(T t) = C;

  static C<int> get staticGetter => C(4);
  static C<X> staticMethod<X>(X x) => C<X>(x);
  static List<C<String>> instances = [C("one")];
}

main() async {
  FutureOr<C?>? c1 = .new(1);
  Expect.equals(1, (await c1)?.value);

  FutureOr<C?>? c2 = .id(2);
  Expect.equals(2, (await c2)?.value);

  FutureOr<C?>? c3 = .f(3);
  Expect.equals(3, (await c3)?.value);

  FutureOr<C<int>?>? c4 = .staticGetter;
  Expect.equals(4, (await c4)?.value);

  FutureOr<C<int>?>? c5 = .staticMethod<int>(5);
  Expect.equals(5, (await c5)?.value);

  FutureOr<List<C<String>?>?>? c6 = .instances;
  Expect.equals("one", (await c6)![0]?.value);
}
