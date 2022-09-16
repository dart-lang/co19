// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Static values list: A static constant variable named values is
/// added as by the declaration static const List<Name> values = [id1, …, idn];
/// where id1…idn are the names of the enum entries of the enum declaration in
/// source/index order. If Name is generic, the List<Name> instantiates Name to
/// its bounds.
///
/// @description Check that static constant named `values` is added
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3
}

enum E2<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);
}

main() {
  Expect.equals(E1.e1, E1.values[0]);
  Expect.equals(E1.e2, E1.values[1]);
  Expect.equals(E1.e3, E1.values[2]);

  Expect.equals(E2.e1, E2.values[0]);
  Expect.equals(E2.e2, E2.values[1]);
  Expect.equals(E2.e3, E2.values[2]);
}
