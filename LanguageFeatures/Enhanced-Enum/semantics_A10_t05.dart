// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the resulting class would have any naming conflicts, or other
/// compile-time errors, the enum declaration is invalid and a compile-time
/// error occurs. Such errors include, but are not limited to:
/// ...
/// Declaring or mixing in a member which is not a valid override of a
/// super-interface member declaration, including, but not limited to, the index
/// and toString members of Enum.
///
/// @description Check that it is no compile-time error to declare a member
/// which is a valid override of a super-interface member declaration
/// @author sgrekhov@unipro.ru
/// @issue 48299

import "../../Utils/expect.dart";

enum E1 {
  e1,
  e2,
  e3;

  String toString([int index = 0]) => "E1";
}

enum E2<T> {
  e1<int>(42),
  e2<String>("42"),
  e3<bool>(false);

  const E2(T t);

  String toString([int index = 0]) => "E2";
}

main() {
  Expect.equals("E1", E1.e1.toString());
  Expect.equals("E1", E1.e2.toString(1));
  Expect.equals("E1", E1.e3.toString());
  Expect.equals("E2", E2.e1.toString());
  Expect.equals("E2", E2.e2.toString(1));
  Expect.equals("E2", E2.e3.toString());
}
