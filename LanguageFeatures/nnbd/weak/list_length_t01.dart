// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Calling the .length setter on a List with element type E with an
/// argument greater than the current length of the list is a runtime error
/// unless Null <: E
///
/// @description Tests weak mode case.
///
/// It is a library issue. The DartDoc on the setter `List.length=`
/// says that an `UnsupportedError` is thrown when `null` is not a valid element,
/// and that it 'fails' if the element type does not allow `null`.
///
/// Failing and throwing could reasonably be assumed to be the same thing here.
/// "The element type does not allow null" could be taken to be true for any
/// non-nullable type, including all the ones that are used here, but seems like
/// it makes more sense to ask whether a dynamic check would actually allow the
/// value null.
///
/// The actual implementation (for instance,
/// `_internal/js_runtime/lib/js_array.dart`) checks whether `null as E` throws,
/// which is consistent with this view of the situation.
///
/// So it seems like it's expected that `list.length = 3;` executes without error
/// and stores null at index 2 in the list when the test runs with unsound null
/// checking.
/// @author iarkh@unipro.ru


// Requirements=nnbd-weak

import "dart:async";
import "../../../Utils/expect.dart";

class A {}
void foo() {}
void bar() {}

typedef void Foo();

test<T>(T t1, T t2) {
  List<T> list = [t1, t2];
  list.length = 3;
  Expect.equals(3, list.length);
  Expect.isNull(list[2]);
}

main() {
  test<int>(3, 14);
  test<String>("Lily", "was here");
  test<A>(A(), A());
  test<Function>(foo, bar);
  test<Foo>(foo, bar);
  test<FutureOr<A>>(A(), A());
  test<FutureOr<Foo>>(foo, bar);
  test<FutureOr<FutureOr<A>>>(A(), A());
}
