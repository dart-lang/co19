// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if the enum declaration contains a
/// static or instance member declaration with the name `values`, or if the
/// superclass or any superinterface of the enum declaration has an interface
/// member named `values`. A `values` static constant member will be provided
/// for the class, this restriction ensures that there is no conflict with that
/// declaration.
///
/// @description Check that it's not an error if the enum declaration contains a
/// static setter with the name `values`, and its argument is not a supertype of
/// the generated member `values`.
/// @author sgrekhov@unipro.ru
/// @issue 48387

import '../../Utils/expect.dart';

enum E1 {
  e1,
  e2,
  e3;

  static void set values(int value) {}
}

enum E2<T> {
  e1<int>(1),
  e2<String>("2"),
  e3<bool>(true);

  const E2(Object val);
  static void set values(List<E2> value) {}
}

main() {
  E1.values = 42;
  Expect.listEquals([E1.e1, E1.e2, E1.e3], E1.values);

  E2.values = <E2>[];
  Expect.listEquals([E2.e1, E2.e2, E2.e3], E2.values);
}
