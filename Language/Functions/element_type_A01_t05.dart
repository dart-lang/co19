// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the union-free type of a type `T` as follows:
/// If `T` is of the form `S?` or the form `FutureOr<S>` then the union-free
/// type of `T` is the union-free type of `S`. Otherwise, the union-free type
/// of `T` is T.
///
/// We define the element type of a generator function `f` as follows:
/// Let `S` be the union-free type of the declared return type of `f`. If `f` is
/// a synchronous generator and `S` implements `Iterable<U>` for some `U` then
/// the element type of `f` is `U`.
///
/// @description Check that runtime type of an element type of a synchronous
/// generator function `f` is `U`, where `S` is a union-free type of the
/// declared return type of `f` and `S` implements `Iterable<U>`. Test the
/// run-time types of objects returned by a synchronous generator function
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

Iterable<int?>? f1() sync* {
  yield 1;
  yield 2;
  yield null;
}

Iterable<int>? f2() sync* {
  yield 1;
  yield 2;
  yield 3;
}

main() {
  Expect.iterableElementsRuntimeIsNot<num?>(f1());
  Expect.iterableElementsRuntimeIsNot<int>(f1());
  Expect.iterableElementsRuntimeIsNot<Object>(f1());
  Expect.iterableElementsRuntimeIsNot<Object?>(f1());
  Expect.iterableElementsRuntimeIsNot<dynamic>(f1());
  Expect.iterableElementsRuntimeIs<int?>(f1());

  Expect.iterableElementsRuntimeIsNot<num?>(f2());
  Expect.iterableElementsRuntimeIsNot<num>(f2());
  Expect.iterableElementsRuntimeIsNot<int?>(f2());
  Expect.iterableElementsRuntimeIsNot<Object>(f2());
  Expect.iterableElementsRuntimeIsNot<Object?>(f2());
  Expect.iterableElementsRuntimeIsNot<dynamic>(f2());
  Expect.iterableElementsRuntimeIs<int>(f2());
}
