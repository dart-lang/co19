// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// TODO (sgrekhov) Update assertion part when appropriate spec will be ready
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
/// @description Checks that in an async for-in loop if `I` is `dynamic` and
/// runtime type of `I` is `Stream<T>` where `T` is assignable to `<pattern>`
/// required type then for-in statement works as expected. In particular, if `I`
/// is `dynamic` then element type is `dynamic` and execution of the body does
/// take place
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";
import "patterns_lib.dart";

main() async {
  String log = "";
  await for (var (num v1) in Stream.fromIterable([1, 2, 3]) as dynamic) {
    v1.expectStaticType<Exactly<num>>();
    log += "$v1;";
  }
  Expect.equals("1;2;3;", log);

  log = "";
  await for (final (v2) in Stream<num>.fromIterable([1, 2, 3]) as dynamic) {
    Expect.throws(() {
      v2.whatever;
    }); // v2 is dynamic
    log += "$v2;";
  }
  Expect.equals("1;2;3;", log);
  log = "";

  log = "";
  await for (var <num>[v3] in Stream.fromIterable([
    [1],
    [2],
    [3]
  ]) as dynamic) {
    v3.expectStaticType<Exactly<num>>();
    log += "$v3;";
  }
  Expect.equals("1;2;3;", log);

  log = "";
  await for (final [v4] in Stream<List<num>>.fromIterable([
    [1],
    [2],
    [3]
  ]) as dynamic) {
    Expect.throws(() {
      v4.whatever;
    });
    log += "$v4;";
  }
  Expect.equals("1;2;3;", log);

  log = "";
  await for (var <String, num>{"k1": v5} in Stream.fromIterable([
    {"k1": 1}
  ]) as dynamic) {
    v5.expectStaticType<Exactly<num>>();
    log += "$v5;";
  }
  Expect.equals("1;", log);

  log = "";
  await for (final {"k1": v6} in Stream<Map<String, num>>.fromIterable([
    {"k1": 1}
  ]) as dynamic) {
    Expect.throws(() {
      v6.whatever;
    });
    log += "$v6;";
  }
  Expect.equals("1;", log);

  log = "";
  await for (var (num v7, n: num v8)
      in Stream.fromIterable([(1, n: 2)]) as dynamic) {
    v7.expectStaticType<Exactly<num>>();
    v8.expectStaticType<Exactly<num>>();
    log += "$v7;$v8;";
  }
  Expect.equals("1;2;", log);

  log = "";
  await for (final (v9, n: v10)
      in Stream<(num, {num n})>.fromIterable([(1, n: 2)]) as dynamic) {
    Expect.throws(() {
      v9.whatever;
    });
    Expect.throws(() {
      v10.whatever;
    });
    log += "$v9;$v10;";
  }
  Expect.equals("1;2;", log);

  log = "";
  await for (var Square<Centimeter>(area: v11)
      in Stream.fromIterable([Square<Centimeter>(1)]) as dynamic) {
    v11.expectStaticType<Exactly<Unit<Centimeter>>>();
    log += "$v11;";
  }
  Expect.equals("1;", log);

  log = "";
  await for (final Square(area: v12)
      in Stream<Square<Centimeter>>.fromIterable([Square<Centimeter>(1)])
          as dynamic) {
    v12.expectStaticType<Exactly<Unit<MetricUnits>>>();
    log += "$v12;";
  }
  Expect.equals("1;", log);
}
