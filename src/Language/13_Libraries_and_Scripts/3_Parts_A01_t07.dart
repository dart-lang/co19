/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library may be divided into parts, each of which can be stored in a separate
 * location. A library identifies its parts by listing them via part directives.
 * A part directive specifies a URI where a Dart compilation unit that should
 * be incorporated into the current library may be found.
 * partDirective:
 *   metadata part of identifier (‘.’ identifier)* ‘;’
 * ;
 * @description Checks that in a compile-time error if the part directive includes 
 * an additive expression instead of URI.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

part 0+0;

main() {
}
