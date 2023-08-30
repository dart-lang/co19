// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion new Expando([String name])
/// Creates a new Expando. The optional name is only used for debugging purposes
/// and creating two different Expandos with the same name yields two Expandos
/// that work on different properties of the objects they are used on.
/// @description Checks two Expandos constructed with identical arguments are
/// still different objects.
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(identical(new Expando("foo"), new Expando("foo")));
}
