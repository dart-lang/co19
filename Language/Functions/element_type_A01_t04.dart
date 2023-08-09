// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type derived from a type T as follows:
/// If T is of the form S? or the form FutureOr<S> then the union-free type
/// derived from T is the union-free type derived from S. Otherwise, the
/// union-free type derived from T is T
///
/// We define the element type of a generator function `f` as follows:
/// Let S be the union-free type derived from the declared return type of f. If
/// f is a synchronous generator and S implements Iterable<U> for some U then
/// the element type of f is U.
///
/// @description Check that element type of a synchronous generator function `f`
/// is `U`, where `S` is a union-free type of the declared return type of `f`
/// and `S` implements `Iterable<U>`
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

FutureOr<Iterable<int>?> foo() sync* {
  yield 1;
  yield 2;
  yield 3;
}

main() {
  var o = foo();
  o.expectStaticType<Exactly<FutureOr<Iterable<int>?>>>();
  if (o is Future<Iterable<int>?>) {
    print("No");
  } else if (o == null) {
    print("No");
  } else {
    // Now static type must be `Iterable<int>
    o.expectStaticType<Exactly<Iterable<int>>>();
    Expect.isTrue(o is Iterable<int>, ": o is ${o.runtimeType}");
    Expect.isRuntimeTypeIterable<int>(o);
    Expect.isNotRuntimeTypeIterable<Never>(o);
  }
}
