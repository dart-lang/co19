// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// A constant map literal, const <K, V >{k1: v1, ..., kn: vn}, or
/// <K, V >{k1: v1, ..., kn: vn} that occurs in a constant context, is a
/// potentially constant expression. It is further a constant expression if the
/// map literal evaluates to an object.
///
/// @description Checks that a constant map literal of the form
/// `const <K, V >{k1: v1, ..., kn: vn}`, or `<K, V >{k1: v1, ..., kn: vn}` that
/// occurs in a constant context are constants
/// @author iefremov

import '../../../Utils/expect.dart';

main() {
  const c1 = <String, int>{"one": 1, "two": 2};
  var c2 = const {"one": 1, "two": 2};

  var c3 = const <num, Object>{};
  const Map<num, Object> c4 = {};

  const c5 = <Object, Object>{[]: [], {}: {}, (): ()};
  var c6 = const {[]: [], {}: {}, (): ()};

  Expect.identical(c1, c2);
  Expect.identical(c3, c4);
  Expect.identical(c5, c6);
}
