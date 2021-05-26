// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion If a name N is referenced by a library L and N is introduced into
/// the top level scope L by more than one import, and not all the imports denote
/// the same declaration, then:
/// • A static warning occurs.
/// • If N is referenced as a function, getter or setter, a NoSuchMethodError is
///   raised.
/// • If N is referenced as a type, it is treated as a malformed type.
/// It is neither an error nor a warning if N is introduced by two or more
/// imports but never referred to.
/// @description Checks that it is not a static warning or error if two different
/// libraries introduce the same name (both via re-export of a third library) to
/// the top level scope of L and L uses it as a type annotation in a type cast
/// expression.
/// @author rodionov
/// @reviewer kaigorodov


import "same_name_t20_p1_lib.dart";
import "same_name_t20_p2_lib.dart";

main() {
  try {
    1 as foo;
  } catch (anything) {}
}
