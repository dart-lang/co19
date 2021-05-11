// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a list or set literal has a static type that is not
/// dynamic and not a subtype of Iterable<Object>.
/// @description Checks that it is no compile error if spread element in the
/// set is dynamic or assignable to [Iterable]
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

main() {
  dynamic x1 = [];
  List x2 = [];
  Set x3 = {};
  Iterable x4 = [];

  Set res;

  res = {...x1};
  res = {...x2};
  res = {...x3};
  res = {...x4};
}
