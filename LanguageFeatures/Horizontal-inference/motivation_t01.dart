// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The key motivating example is the Iterable.fold method, which has
/// the following signature:
///
/// abstract class Iterable<E> {
///   T fold<T>(T initialValue, T combine(T previousValue, E element)) { ... }
/// }
/// A typical usage of fold today looks like this:
///
/// Iterable<int> values = ...;
/// int largestValue = values.fold(0, (a, b) => a < b ? b : a);
/// Note the use of the explicit type int for largestValue. We would like for
/// the user to be able to drop this explicit type, and instead write:
///
/// Iterable<int> values = ...;
/// var largestValue = values.fold(0, (a, b) => a < b ? b : a);
/// Today this doesn't work, because without the leading int, the downwards
/// inference phase of type inference has no information with which to choose a
/// preliminary type for the type parameter T, so the type context used for
/// inference of the function literal
/// (a, b) => a < b ? b : a is ? Function(?, int).
/// Hence, a gets assigned a static type of Object?, and this leads to a compile
/// error at a < b.
///
/// With horizontal inference, type inference first visits the 0, and uses its
/// static type to assign a preliminary type of int to the type parameter T.
/// Then, when it proceeds to perform type inference on the function literal,
/// the type context is int Function(int, int). This results in a being assigned
/// a static type of int, which is what the user intends.
///
/// @description Checks that motivation example works as expected
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  Iterable values = [3, 1, 4, 1, 5, 9, 2, 6];
  var largestValue = values.fold(0, (a, b) => a < b ? b : a);
  Expect.equals(9, largestValue);
}
