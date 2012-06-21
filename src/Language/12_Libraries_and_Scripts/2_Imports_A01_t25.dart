/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a library to be used in the scope of another library.
 * libraryImport:
 *   `#import' `(' stringLiteral
 *     (`, ' `export:' (true | false))? 
 *     (`, ' combinator)* 
 *     (`, ' `prefix:' stringLiteral)? `)' `;'
 * ;
 * combinator:
 *   `show:' listLiteral |
 *   `hide:' listLiteral
 * ;
 * @description Checks that it is a compile-time error if the export part
 * of an import directive is missing the value.
 * @compile-error
 * @author rodionov
 */

#import("2_Imports_lib.dart", export:);

main() {
  try {
    someVar = 0;
  } catch(var e) {}
}
