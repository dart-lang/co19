// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member invocation still only works on an uninstantiated
/// type literal. You can write List.copyRange, but not List<int>.copyRange.
///
/// Allowing List<int>.copyRange is confusing. The invocation will not have
/// access to the type parameter anyway, so allowing it is not going to help
/// anyone. The occurrence of List in List.copyRange refers to the class
/// declaration, treated as a namespace, not the class itself.
///
/// This goes for type aliases too. We can declare typedef MyList<T> = List<T>;
/// and typedef IntList = List<int>; and do MyList.copyRange or
/// IntList.copyRange to access the static member of the declaration of the type
/// being aliased. This is specially introduced semantics for aliases of class
/// or mixin types, not something that falls out of first resolving the type
/// alias to the class or mixin type. We do not allow MyList<int>.copyRange
/// either, even though we allow IntList.copyRange. They are not the same when
/// doing static member accesses.
///
/// @description Checks that it is allowed to tear off MyList.copyRange and
/// IntList.copyRange, where
/// typedef MyList<T> = List<T>;
/// typedef IntList = List<int>;
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

typedef MyList<T> = List<T>;
typedef IntList = List<int>;

main() {
  var list1 = [1, 2, 3, 4];
  var list2 = [3, 1, 4];
  var f1 = MyList.copyRange;
  var f2 = IntList.copyRange;
  f1(list1, 1, list2);
  Expect.listEquals([1, 3, 1, 4], list1);
  f2(list1, 0, list2);
  Expect.listEquals([3, 1, 4, 4], list1);
}
