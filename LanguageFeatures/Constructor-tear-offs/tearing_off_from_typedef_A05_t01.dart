// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Example:
///
//   typedef ListList<T> = List<List<T>>;
//   Corresponding factory function
//   List<List<T>> ListList$filled$tearoff<T>(int length, List<T> value) =>
//     List<List<T>>.filled(length, value);
///
/// @description Checks example 1 from the Spec
///
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

typedef ListList<T> = List<List<T>>;

main() {
  Expect.notEquals(List<List>.filled, ListList.filled);

  Expect.identical(List<List<dynamic>>.filled, ListList<dynamic>.filled);
  Expect.identical(List<List<int>>.filled, ListList<int>.filled);
  Expect.identical(List<List<Never>>.filled, ListList<Never>.filled);
  Expect.identical(List<List<Null>>.filled, ListList<Null>.filled);
  Expect.identical(List<List<List>>.filled, ListList<List>.filled);
}
