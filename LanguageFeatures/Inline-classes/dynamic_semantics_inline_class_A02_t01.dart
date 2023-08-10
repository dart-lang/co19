// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The run-time representation of a type argument which is an
/// extension type V is the run-time representation of the corresponding
/// instantiated representation type.
///
/// @description Check that the run-time representation of a type argument which
/// is an extension type is the the run-time representation of the corresponding
/// instantiated representation type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

extension type V1(int id) {}

extension type V2<T>(T id) {}

class C<T> {
  T x;
  C(this.x);
}

main() {
  var l1 = C<V1>(V1(1));
  Expect.equals(C<int>, l1.runtimeType);
  (l1 as C<int>).x = 42;
  Expect.equals(42, l1.x);
  Expect.throws(() { (l1 as dynamic).x = 3.14;});

  C<V2<String>> l2 = C<V2<String>>(V2("42"));
  Expect.equals(C<String>, l2.runtimeType);
  (l2 as C<String>).x = "answer";
  Expect.throws(() { (l2 as dynamic).x = 42;});
}
