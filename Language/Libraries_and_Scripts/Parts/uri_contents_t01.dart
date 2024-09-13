// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the contents of the URI are not a
/// valid part declaration.
///
/// @description Checks that it is a compile-time error if the contents of an
/// URI is not a valid part declaration (syntax error in a top-level
/// declaration).
/// @author rodionov

part "uri_contents_t01_part.dart";

main() {
  print(foo);
}
