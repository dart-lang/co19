/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A symbol literal denotes the name of a declaration in a Dart
 * program.
 * symbolLiteral:
 *   `#' (operator | (identifier (`.' identifier)*))
 * ;
 * A symbol literal #id where id does not begin with an underscore (_) is
 * equivalent to the expression const Symbol(id).
 * A symbol literal #_id evaluates to the object that would be returned by
 * the call mirror.getPrivateSymbol(id) where mirror is an instance of the
 * class LibraryMirror defined in the library dart:mirrors, reflecting the
 * current library.
 * @note TODO symbol literals are not yet implemented
 * @description Checks a basic case that #id is equivalent to const Symbol(id)
 * @author ilya
 * @issue 12171
 */
import "../../Utils/expect.dart";

main() {
  Expect.equals(const Symbol('foo'), #foo);
  Expect.identical(const Symbol('foo'), #foo);
}


