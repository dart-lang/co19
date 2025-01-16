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
/// union types. Test a mixin.
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
  static List<M<String>> instances = [MC("one")];

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

  FutureOr<List<M<String>?>?>? m3 = .instances;
  Expect.equals(MC("one"), (await m3)![0]);
}
