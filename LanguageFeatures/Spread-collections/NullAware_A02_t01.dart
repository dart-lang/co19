/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Note that neither the regular spread nor the null-aware spread
 * have any affect on [null] values inside the sequence being spread. As far as
 * the language is concerned, [null] is a perfectly valid value for a sequence
 * to contain:
 *
 *   var things = [2, null, 3];
 *   var more = [1, ...things, 4]; // [1, 2, null, 3, 4].
 *   var also = [1, ...?things, 4]; // [1, 2, null, 3, 4].
 *
 *   If you want to skip over [null] elements in a sequence, you can do so
 *   explicitly:
 *
 *   var things = [2, null, 3];
 *   var more = [1, ...things.where((thing) => thing != null), 4];
 *   // [1, 2, 3, 4].
 * @description Checks that [null] element is allowed inside the spreadable
 * element in the list.
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

main() {
  var things = [2, null, 3];

  var more = [1, ...things, 4];
  Expect.listEquals([1, 2, null, 3, 4], more);

  var also = [1, ...?things, 4];
  Expect.listEquals([1, 2, null, 3, 4], more);

  more = [1, ...things.where((thing) => thing != null), 4];
  Expect.listEquals([1, 2, 3, 4], more);
}
