// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is not an error to specify the type alias of the
/// type `void` on the right side of an `is` expression.
/// @author sgrekhov22@gmail.com

typedef Void = void;

main() {
  bool b = null is Void;
}
