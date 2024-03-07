// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At run time, for a given instance o typed as an extension type V,
/// there is no reification of V associated with o.
///
/// @description Check that an extension type is 'erased' at run time
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type ET1(int id) {
  int add(int other) => id + other;
}

extension type ET2<T>(T id) {
  bool equal(T other) => id == other;
}

main() {
  dynamic d1 = ET1(1);
  Expect.throws(() {d1.id;});
  Expect.throws(() {d1.add(1);});
  dynamic d2 = ET2(1);
  Expect.throws(() {d2.id;});
  Expect.throws(() {d2.equal(1);});
  dynamic d3 = ET2<int>(1);
  Expect.throws(() {d3.id;});
  Expect.throws(() {d3.equal(1);});
}
