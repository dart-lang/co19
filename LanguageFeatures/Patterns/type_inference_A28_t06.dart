// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// To type check a pattern p being matched against a value of type M:
/// ...
/// List:
///
/// i. Calculate the value's element type E:
///
///   a. If p has a type argument T, then E is the type T.
///   b. Else if M implements List<T> for some T then E is T.
///   c. Else if M is dynamic then E is dynamic.
///   d. Else E is Object?.
///
/// ii. Type-check each non-rest element subpattern using E as the matched value
///   type. Note that we calculate a single element type and use it for all
///   subpatterns. In:
///     var [a, b] = [1, 2.3];
///   both a and b use num as their matched value type.
///
/// iii. If there is a matching rest element, type-check its subpattern using
///   List<E> as the matched value type.
///
/// iv. The required type of p is List<E>.
///
/// @description Check that rest element subpattern is type checked using
/// `List<E>` as the matched value type
/// @author sgrekhov22@gmail.com

main() {
  var <String>[a1, b1, ...List<int> r1] = [1, 2, 42, 3];
//                                  ^^
// [analyzer] unspecified
// [cfe] unspecified

  final <int>[a2, b2, ...List<String> r2] = [1, 2, 42, 3];
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
