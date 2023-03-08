// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// If p with required type T is in an irrefutable context:
/// - It is a compile-time error if M is not assignable to T.
/// - Else if M is not a subtype of T then an implicit coercion or cast is
///   inserted before the pattern binds the value, tests the value's type,
///   destructures the value, or invokes a function with the value as a target
///   or argument.
///
/// @description Check that if `M` is not a subtype of `T` then generic function
/// instantiation is performed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

T foo<T>(T t) => t;

main() {
  var list = [foo];
  var <T Function<T>(T)>[int Function(int) f1] = list;
  Expect.equals(42, f1(42));
  Expect.throws(() {
    f1("1" as dynamic);
  });

  var <T Function<T>(T)>[int Function(int) fInt &&
      String Function(String) fString] = list;
  Expect.equals(42, fInt(42));
  Expect.throws(() {
    fInt("1" as dynamic);
  });
  Expect.equals("42", fString("42"));
  Expect.throws(() {
    fString(1 as dynamic);
  });

  final map = {"key1": foo};
  final <String, T Function<T>(T)>{"key1": int Function(int) f2} = map;
  Expect.equals(42, f2(42));
  Expect.throws(() {
    f2("1" as dynamic);
  });

  var record = (x: foo);
  var (x: T Function<T>(T) f3) = record;
  Expect.equals(42, f3(42));
  Expect.throws(() {
    f3("1" as dynamic);
  });
}
