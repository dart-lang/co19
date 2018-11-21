/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  For set literals with element type T, the static type is always
 * Set<T>, but static analysis will reject an assignment of a non-constant set
 * literal to a type that is not a super-type of LinkedHashSet<T> (an implicit
 * down-cast below the type LinkedHashSet<T>), and of a constant set literal to
 * a type that is not a super-type of Set<T> (that is, any implicit down-cast).
 *
 * @description Check that static analysis will reject an assignment of a
 * constant set literal to a type that is not a super-type of Set<T>
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";

class C<T> with SetMixin<T> implements Set<T> {

  factory C({bool equals(T e1, T e2),
    int hashCode(T e),
    bool isValidKey(potentialKey)}) {}

  @override
  bool add(T value) {
    // TODO: implement add
    return null;
  }

  @override
  T lookup(Object element) {
    // TODO: implement lookup
    return null;
  }

  @override
  bool remove(Object value) {
    // TODO: implement remove
    return null;
  }

  @override
  bool contains(Object element) {
    // TODO: implement contains
    return null;
  }

  @override
  Set<T> toSet() {
    // TODO: implement toSet
    return null;
  }

  @override
  // TODO: implement iterator
  Iterator<T> get iterator => null;

  @override
  // TODO: implement length
  int get length => null;
}

main() {
  C<int> c = const <int> {};                        //# 01: compile-time error
  C<int> c = const {3, 1, 4,};                      //# 02: compile-time error
  C c = const {3, 1, 4,};                           //# 03: compile-time error
  C c = const {3, 1, 4,null, };                     //# 04: compile-time error

  LinkedHashSet<int> c = const <int> {};            //# 05: compile-time error
  LinkedHashSet<int> c = const {3, 1, 4,};          //# 06: compile-time error
  LinkedHashSet c = const {3, 1, 4,};               //# 07: compile-time error
  LinkedHashSet c = const {3, 1, 4, null, bool};    //# 08: compile-time error
}
