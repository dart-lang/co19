/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion URIs are specified by means of string literals:
 * uri:
 *   stringLiteral
 * ;
 * It is a compile-time error if the string literal x that describes a URI 
 * is not a compile-time constant, or if x involves string interpolation.
 * @description Checks that it is not an error to use a raw string literal
 * as a URI in an import directive.
 * @author rodionov
 * @reviewer kaigorodov
 */
import r"library1.dart";

main() {
  new FooClass();
}
