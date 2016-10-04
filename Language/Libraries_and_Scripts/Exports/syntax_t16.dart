/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library L exports a namespace, meaning that the declarations in
 * the namespace are made available to other libraries if they choose to import
 * L. The namespace that L exports is known as its exported namespace.
 * libraryExport:
 *   metadata export uri combinator* `;'
 * ;
 * @description Checks that it is not an error when the identifiers used with
 * show/hide combinators are also named 'hide' and 'show', and that filtering
 * the export namespace is done correctly.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */
import "syntax_t02_lib.dart";

main() {
  var x = foo; // foo is hidden, so expecting compile error
}
