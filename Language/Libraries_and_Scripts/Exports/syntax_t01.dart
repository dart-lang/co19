// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A library L exports a namespace, meaning that the declarations in
/// the namespace are made available to other libraries if they choose to import
/// L. The namespace that L exports is known as its exported namespace.
/// libraryExport:
///   metadata export uri combinator* `;'
/// ;
/// @description Checks that it is a compile-time error if export token is
/// prefixed with a '#' character.
/// @author rodionov
/// @issue 44990

import "syntax_t01_lib.dart";

main() {
  var x = foo;
}
