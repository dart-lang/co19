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
/// union types. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

extension type ET<T>(T value) {
  ET.id(this.value);
  factory ET.f(T t) = ET;

  static ET<int> get staticGetter => ET(4);
  static ET<X> staticMethod<X>(X x) => ET<X>(x);
  static List<ET<String>> instances = [ET("one")];
}

main() async {
  FutureOr<ET?>? et1 = .new(1);
  Expect.equals(1, (await et1)?.value);

  FutureOr<ET<int>?>? et2 = .id(2);
  Expect.equals(2, (await et2)?.value);

  FutureOr<ET?>? et3 = .f(3);
  Expect.equals(3, (await et3)?.value);

  FutureOr<ET<int>?>? et4 = .staticGetter;
  Expect.equals(4, (await et4)?.value);

  FutureOr<ET<int>?>? et5 = .staticMethod<int>(5);
  Expect.equals(5, (await et5)?.value);

  FutureOr<List<ET<String>?>?>? et6 = .instances;
  Expect.equals("one", (await et6)![0]?.value);
}
