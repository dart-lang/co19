/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A multi-line comment begins with the token '/*' and ends with the
 * token '*/'. Everything between '/*' and '*/' must be ignored by the Dart
 * compiler unless the comment is a documentation comment. Comments may nest.
 * MULTI LINE COMMENT  :
 *   '/''*' (MULTI LINE COMMENT | ~ '*''/')* '*''/'
 * ;
 * @description Checks that it is a compile-time error when there is an unpaired
 * multi-line comment end token inside another multi-line comment.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

/*
/* Comment */
/*/* Nested comment **/ */
*/ Unpaired token /* */
*/

main() {
}
