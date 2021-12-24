// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null class
/// The reserved word null denotes an object that is the sole instance of this
/// class.
/// @description Checks that null is indeed an instance of class Null.
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(null is Null);
  Expect.runtimeIsType<Null>(null);
}
