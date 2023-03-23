// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  For set literals with element type T, the static type is always
/// Set<T>, but static analysis will reject an assignment of a non-constant set
/// literal to a type that is not a super-type of LinkedHashSet<T> (an implicit
/// down-cast below the type LinkedHashSet<T>), and of a constant set literal to
/// a type that is not a super-type of Set<T> (that is, any implicit down-cast).
///
/// @description Check that static analysis will reject an assignment of a
/// non-constant set literal to a type that is not a super-type of
/// LinkedHashSet<T>
/// @author sgrekhov@unipro.ru

// @dart=2.19

import "dart:collection";

class C<T> with SetMixin<T> implements LinkedHashSet<T> {

  factory C({bool equals(T e1, T e2)?,
    int hashCode(T e)?,
    bool isValidKey(potentialKey)?}) => throw "Should not reach here";

  @override
  bool add(T value) => throw "Should not reach here";

  @override
  T lookup(Object? element) => throw "Should not reach here";

  @override
  bool remove(Object? value) => throw "Should not reach here";

  @override
  bool contains(Object? element) => throw "Should not reach here";

  @override
  Set<T> toSet()  => throw "Should not reach here";

  @override
  Iterator<T> get iterator => throw "Should not reach here";

  @override
  int get length => throw "Should not reach here";
}

main() {
  C<int> c1 = <int> {};
//            ^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//                  ^
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'C<int>'.
  C<int> c2 = {3, 1, 4,};
//            ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'C<int>'.
  C c3 = {3, 1, 4,};
//       ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'C<dynamic>'.
  dynamic d;
  C c4 = {3, 1, 4, null, d};
//       ^^^^^^^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'Set<dynamic>' can't be assigned to a variable of type 'C<dynamic>'.
}
