// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type derived from a type T as follows:
/// If T is of the form S? or the form FutureOr<S> then the union-free type
/// derived from T is the union-free type derived from S. Otherwise, the
/// union-free type derived from T is T
///
/// We define the element type of a generator function `f` as follows:
/// Let S be the union-free type derived from the declared return type of f.
/// ...
/// If `f` is an asynchronous generator and `S` implements `Stream<U>` for some
/// `U` then the element type of `f` is `U`.
///
/// @description Let `f` be an asynchronous generator function whose declared
/// return type derives the union-free type `S`, and assume that `S` implements
/// `Stream<U>`. Then check that the element type of `f` is `U`.
/// @author sgrekhov22@gmail.com
/// @issue 53051, 54159

import "dart:async";
import "../../Utils/expect.dart";

FutureOr<Stream<int?>?> f1() async* {
  yield 1;
  yield 2;
  yield null;
}

FutureOr<Stream<int>?>? f2() async* {
  yield 1;
  yield 2;
  yield 3;
}

main() async {
  var res1 = await f1();
  var it1 = await res1?.toList();
  Expect.isRuntimeTypeImplementsIterable<int?>(it1);

  var it2 = (await f2())?.toList();
  Expect.isRuntimeTypeImplementsIterable<int>(it2);
}
