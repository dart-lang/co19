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
 * @description Check runtime type of set literals expressions
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";
import "dart:collection";

// Class overriding `==`.
class C {
  final int id;
  final String name;
  C(this.id, this.name);
  int get hashCode => id;
  bool operator==(Object other) => other is C && id == other.id;
  String toString() => "C($id, $name)";
}

main() {
  Expect.isTrue({} is LinkedHashMap<dynamic, dynamic>);
  Expect.isTrue(<int, int>{} is LinkedHashMap<int, int>);
  Expect.isTrue(<int>{} is LinkedHashSet<int>);
  Expect.isTrue({1: 1} is LinkedHashMap<int, int>);
  Expect.isTrue({1} is LinkedHashSet<int>);

  Iterable<int> v6 = {};
  Expect.isTrue(v6 is LinkedHashSet<int>);
  Map<int, int> v7 = {};
  Expect.isTrue(v7 is LinkedHashMap<int, int>);
  Object v8 = {};
  Expect.isTrue(v8 is LinkedHashMap<dynamic, dynamic>);
  Iterable<num> v9 = {1};
  Expect.isTrue(v9 is LinkedHashSet<num>);
  Iterable<num> v10 = <int>{};
  Expect.isTrue(v10 is LinkedHashSet<int>);
  Set<int> v11 = {};
  Expect.isTrue(v11 is LinkedHashSet<int>);

  const v12 = {};
  Expect.isTrue(v12 is Map<dynamic, dynamic>);
  const v13 = {1};
  Expect.isTrue(v13 is Set<int>);
  const Set v14  = {} ;
  Expect.isTrue(v14 is Set<dynamic>);
  Set v15 = const {4};
  Expect.isTrue(v15 is Set<dynamic>);

  var v16 = {1, 2, 3, 2, 1};
  Expect.isTrue(v16 is LinkedHashSet<int>);
  var l18 = const {1, 2};
  Expect.isTrue(l18 is Set<int>);

  var v19 = {C(1, "a"), C(2, "a"), C(1, "b")};
  Expect.isTrue(v19 is LinkedHashSet<C>);
  Expect.equals({C(1, "a"), C(2, "a")}, v19);

  var v23 = {1, 2.5};
  Expect.isTrue(v23 is LinkedHashSet<num>);
  var v24 = {1, false};
  Expect.isTrue(v24 is LinkedHashSet<Object>);
  const v26  = {1, false};
  Expect.isTrue(v26 is Set<Object>);
}
