// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The run-time representation of a type argument which is an inline
/// type V is the corresponding instantiated representation type.
///
/// @description Check that the run-time representation of a type argument which
/// is an inline type V is the corresponding instantiated representation type.
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
  List<V1> l1 = [];
  Expect.equals(List<int>, l1.runtimeType);
  (l1 as List<int>).add(42);
  Expect.throws(() { (l1 as dynamic).add(3.14);});

  List<V2<String>> l2 = [];
  Expect.equals(List<String>, l2.runtimeType);
  (l2 as List<String>).add("42");
  Expect.throws(() { (l2 as dynamic).add(42);});
}
