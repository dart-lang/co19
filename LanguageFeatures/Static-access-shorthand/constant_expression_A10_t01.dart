// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that a qualified reference to a static constant variable
/// that is not qualified by a deferred prefix, is a potentially constant and
/// constant expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';
import 'shorthand_lib.dart'as p;

main() {
  const p.C c = .answer;
  Expect.identical(42, c.t);

  const p.M m = .answer;
  Expect.identical(42, m.t);

  const p.E e = .answer;
  Expect.identical(42, e.t);

  const p.ET et = .answer;
  Expect.identical(42, et.t);
}
