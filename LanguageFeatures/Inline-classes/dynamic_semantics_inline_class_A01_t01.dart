// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At run time, for a given instance o typed as an inline type V,
/// there is no reification of V associated with o.
///
/// @description Check that the run-time type of an instance of an inline class
/// is its representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V1 {
  final int id;
  V1(this.id);
}

inline class V2<T> {
  final T id;
  V2(this.id);
}

main() {
  var v1 = V1(42);
  Expect.equals(int, v1.runtimeType);

  int i = v1 as int;
  Expect.equals(42, i);
  Expect.isTrue(i.isEven);

  var v2 = V2<String>("");
  Expect.equals(String, v2.runtimeType);

  String s = v2 as String;
  Expect.equals("", s);
  Expect.isTrue(s.isEmpty);
}
