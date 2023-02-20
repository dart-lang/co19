// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// Record:
/// i. For each field f with subpattern s of p:
///   a. If M is a record type with the same shape as p, then let F be that
///     field's type in M.
///   b. Else if M is dynamic, then let F be dynamic.
///   c. Else let F be Object?. The field subpattern will only be matched at
///     runtime if the value does turn out to be a record with the right shape
///     where the field is present, so it's safe to just assume the field exists
///     when type checking here.
///   d. Type-check s using F as the matched value type.
///
/// ii. The required type of p is a record type with the same shape as p and
///   Object? for all fields.
///
/// @description Check that each field of the record pattern is type checked.
/// Test the case when `M` is a record type with the same shape as `p`. It is a
/// compile-time error if type test fails in an irrefutable context
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

main() {
  var (int v1, name: String n1) = (3.14, name: "pi");
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

  final (int v1, name: String n1) = (1, name: "one" as Object);
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
}
