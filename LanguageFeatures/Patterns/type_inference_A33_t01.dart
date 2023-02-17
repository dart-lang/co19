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
/// @description Check that if `M` is not a subtype of `T` then an implicit cast
/// is performed
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";

main() {
  var list = [1 as dynamic];
  Expect.throws(() {
    var [String _] = list;
  });

  final map = {"key1": 1 as dynamic};
  Expect.throws(() {
    final {"key1": String _} = map;
  });

  var record = (x: 1 as dynamic);
  Expect.throws(() {
    var (x: String _) = record;
  });
}
