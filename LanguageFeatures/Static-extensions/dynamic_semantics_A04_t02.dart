// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Invocations of redirecting factory constructors defined in
/// extensions (including const invocations) are evaluated by evaluating an
/// invocation of the underlying redirectee, with type arguments as provided by
/// type inference, and term arguments as taken from the declaration of the
/// enclosing constructor as usual.
///
/// @description Checks that a constant invocation of a redirecting factory
/// constructor declared in an extension is evaluated as a constant invocation
/// of the redirectee with the type arguments provided by type inference and
/// with the arguments of the invocation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

import '../../Utils/expect.dart';

class C<X, Y> {
  final Object? v;
  const C._(this.v);
}

extension ExtC<T> on C<T, T> {
  const factory c(List<T> v) = C<T, T>._;
}

extension type const ET<X, Y>._(Object? v) {}

extension ExtET<T> on ET<T, T> {
  const factory c(List<T> v) = ET<T, T>._;
}

main() {
  Expect.identical(const C<int, int>._(<int>[]), const C.c(<int>[]));
  Expect.identical(const C<int, int>._(<int>[]), const C<num, int>.c([]));
  Expect.identical(const C<num, num>._(<num>[]), const ExtC<num>.c([]));
  const C<num, num> c1 = C.c([]);
  Expect.identical(const C<num, num>._(<num>[]), c1);

  Expect.identical(const ET<int, int>._(<int>[]), const ET.c(<int>[]));
  Expect.identical(const ET<int, int>._(<int>[]), const ET<num, int>.c([]));
  Expect.identical(const ET<num, num>._(<num>[]), const ExtET<num>.c([]));
  const ET<num, num> et1 = ET.c([]);
  Expect.identical(const ET<num, num>._(<num>[]), et1);
}
