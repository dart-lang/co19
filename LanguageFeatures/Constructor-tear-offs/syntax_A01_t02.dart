// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of the named constructor tear-off expression is
/// the same as the static type of the corresponding constructor function
/// tear-off.
///
/// @description Checks that it is a syntax error to attempt to tear-off
/// a constructor using `(C<T>).new` syntax.
/// @author sgrekhov22@gmail.com

class C<T> {
  C() {}
}

main() {
  (C<int>).new;   //# 01: syntax error
  (C<int>).new(); //# 02: syntax error
}
