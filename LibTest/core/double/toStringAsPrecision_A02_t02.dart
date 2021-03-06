// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

 /**
 * @assertion String toStringAsPrecision(int precision)
 * Throws [Error] if [precision] is null.
 * @description Checks that compile error appears if [precision] is statically
  * [:null:].
 * @author iarkh
 */

main() {
  0.1.toStringAsPrecision(null);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
