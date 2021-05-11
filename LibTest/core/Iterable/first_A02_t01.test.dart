// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E first
/// Returns the first element.
/// Throws a StateError if this is empty. Otherwise returs the first element
/// in the iteration order, equivalent to (iterator..moveNext())..current.
/// @description Checks that a StateError is thrown when this is empty.
/// @author kaigorodov

library first_A02_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.throws(() {create().first;}, (e) => e is StateError);
}
