// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a list or set literal has a static type that is not
/// dynamic and not a subtype of Iterable<Object>.
/// @description Checks that compile error is not thrown if spread element in the
/// list is dynamic and is not assignable to [Iterable] in runtime
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

main() {
  dynamic x1;
  dynamic x2 = 1;
  dynamic x3 = null;
 dynamic x4 = {1: 2};

  List res;

  Expect.throws(() => res = [...x1]);
  Expect.throws(() => res = [...x2]);
  Expect.throws(() => res = [...x3]);
  Expect.throws(() => res = [...x4]);
}
