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
/// union types. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

enum E<T> {
  e1(1), e2(2), e3("3"), e4("4");
  final T value;
  const E(this.value);

  static E<int> get staticGetter => E.e1;
  static E staticMethod() => E.e2;
  static List<E<String>> instances = [E.e3];
}

main() async {
  FutureOr<E<int>?>? e1 = .staticGetter;
  Expect.equals(E.e1, await e1);

  FutureOr<E?>? e2 = .staticMethod();
  Expect.equals(E.e2, await e2);

  FutureOr<List<E<String>?>?>? e3 = .instances;
  Expect.equals(E.e3, (await e3)![0]);

  FutureOr<E<String>?>? e4 = .e4;
  Expect.equals(E.e4, await e4);
}
