// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A statement of the form:
///
/// for (<keyword> <pattern> in <expression>) <statement>
///
/// Where <keyword> is var or final is treated like so:
/// 1. Let I be the static type of <expression>, inferred using context type
///   schema Iterable<P> where P is the context type schema of <pattern>.
/// 2. Calculate the element type of I:
///   i. If I implements Iterable<T> for some T then E is T.
///   ii. Else if I is dynamic then E is dynamic.
///   iii. Else it is a compile-time error.
/// 3. Type check <pattern> with matched value type E.
/// 4. If there are no compile-time errors, then execution proceeds as the
///   following code, where id1 and id2 are fresh identifiers:
/// ```dart
/// var id1 = <expression>;
/// var id2 = id1.iterator;
/// while (id2.moveNext()) {
///   <keyword> <pattern> = id2.current;
///   { <statement> }
/// }
/// ```
/// @description Checks that if `I` implements `Iterable<T>` for some `T` then
/// `E` is `T`. Test `T` inferred from `<pattern>` to `<expression>` and from
/// `<expression>` to `<pattern>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

extension Storing on Object? {
  static dynamic stored;
  void get store => stored = this;
}

main() {
  String log = "";
  for (var (num v1) in [1, 2, 3]..store) {
    v1.expectStaticType<Exactly<num>>();
    log += "$v1;";
  }
  Expect.equals("1;2;3;", log);
  Expect.isTrue(Storing.stored is List<num>);
  Storing.stored.add(42);
  Storing.stored.add(3.14);

  log = "";
  for (final (v2) in <num>[1, 2, 3]) {
    v2.expectStaticType<Exactly<num>>();
    log += "$v2;";
  }
  Expect.equals("1;2;3;", log);
  log = "";

  log = "";
  for (var <num>[v3] in [[1], [2], [3]]..store) {
    v3.expectStaticType<Exactly<num>>();
    log += "$v3;";
  }
  Expect.equals("1;2;3;", log);
  Expect.isTrue(Storing.stored is List<List<num>>);
  Storing.stored.first.add(42);
  Storing.stored.first.add(3.14);

  log = "";
  for (final [v4] in <List<num>>[[1], [2], [3]]) {
    v4.expectStaticType<Exactly<num>>();
    log += "$v4;";
  }
  Expect.equals("1;2;3;", log);

  log = "";
  for (var <String, num>{"k1": v5} in [{"k1": 1}]..store) {
    v5.expectStaticType<Exactly<num>>();
    log += "$v5;";
  }
  Expect.equals("1;", log);
  Expect.isTrue(Storing.stored is List<Map<String, num>>);
  Expect.isTrue(Storing.stored.first is Map<String, num>);
  Storing.stored.first["answer"] = 42;
  Storing.stored.first["pi"] = 3.14;

  log = "";
  for (final {"k1": v6} in <Map<String, num>>[{"k1": 1}]) {
    v6.expectStaticType<Exactly<num>>();
    log += "$v6;";
  }
  Expect.equals("1;", log);

  log = "";
  for (var (num v7, n: num v8) in [(1, n: 2)]..store) {
    v7.expectStaticType<Exactly<num>>();
    v8.expectStaticType<Exactly<num>>();
    log += "$v7;$v8;";
  }
  Expect.equals("1;2;", log);
  Expect.isTrue(Storing.stored is List<(num, {num n})>);

  log = "";
  for (final (v9, n: v10) in <(num, {num n})>[(1, n: 2)]) {
    v9.expectStaticType<Exactly<num>>();
    v10.expectStaticType<Exactly<num>>();
    log += "$v9;$v10;";
  }
  Expect.equals("1;2;", log);

  log = "";
  for (var Square<Centimeter>(area: v11) in [Square(1)]..store) {
    v11.expectStaticType<Exactly<Unit<Centimeter>>>();
    log += "$v11;";
  }
  Expect.equals("1;", log);
  Expect.isTrue(Storing.stored is List<Square<Centimeter>>);

  log = "";
  for (final Square(area: v12) in <Square<Centimeter>>[Square<Centimeter>(1)]) {
    v12.expectStaticType<Exactly<Unit<Centimeter>>>();
    log += "$v12;";
  }
  Expect.equals("1;", log);
}
