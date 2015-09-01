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
 * @description Checks that symbol literal whose name starts with an
 * underscore evaluates to the object returned by mirror.getPrivateSymbol(id)
 * @note Test is commented out. Language tests should not import extra libraries.
 * @author ilya
 */

/*
library test;

import "dart:mirrors";
import "../../Utils/expect.dart";

var _private;

main() {
  var l = currentMirrorSystem().findLibrary(#test).first;
  //print(l.getPrivateSymbol); // can't check, method not implemented
}
*/

main() {
}

