// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A collection element of the form:
///
/// for (<keyword> <pattern> in <expression>) <element>
///
/// Where <keyword> is var or final is treated like so:
/// 1. Let I be the static type of <expression>, inferred using context type
///   schema Iterable<P> where P is the context type schema of <pattern>.
/// 2. Calculate the element type of I:
///     i. If I implements Iterable<T> for some T then E is T.
///     ii. Else if I is dynamic then E is dynamic.
///     iii. Else it is a compile-time error.
/// 3. Type check <pattern> with matched value type E.
/// 4. If there are no compile-time errors, then execution proceeds as the
///   following code, where id1 and id2 are fresh identifiers and append() is
///   an operation to add an element to the surrounding collection being built:
/// ```dart
/// I id1 = <expression>;
/// Iterator<E> id2 = id1.iterator;
/// while (id2.moveNext()) {
///   <keyword> <pattern> = id2.current;
///   append(<element>);
/// }
/// ```
/// @description Checks that if `I` is `dynamic` and runtime type of `I` is
/// `Iterable<T>` where `T` is not assignable to `<pattern>` required type then
/// a run-time error occurs. Test a set literal
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  Expect.throws(() {
    {
      for (var (int v1) in <num>[1, 2, 3.14] as dynamic) v1
    };
  });

  Expect.throws(() {
    {
      for (final <int>[v2] in <List<num>>[[1], [2], [3]] as dynamic) v2
    };
  });

  Expect.throws(() {
    {
      for (var <String, int>{"k1": v3} in
          <Map<String, num>>[{"k1": 1}] as dynamic) v3
    };
  });

  Expect.throws(() {
    {
      for (final (int v4,) in <(num,)>[(1.1,)] as dynamic) v4
    };
  });

  Expect.throws(() {
    {
      for (var (n: int v5) in <({num n})>[(n: 2.1)] as dynamic) v5
    };
  });

  Expect.throws(() {
    {
      for (var Square<Centimeter>(area: v6) in [Circle(1)] as dynamic) v6
    };
  });

  Expect.throws(() {
    {
      for (final Square<Meter>(area: v7) in
          <Square<Centimeter>>[Square<Centimeter>(1)] as dynamic) v7
    };
  });
}
