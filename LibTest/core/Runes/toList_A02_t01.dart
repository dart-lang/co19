/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> toList({bool growable: true})
 * The list is fixed-length if [growable] is false.
 * @description Checks that the returned list is fixed-length
 * if [growable] is false.
 * @author msyabro
 */

import "../../../Utils/expect.dart";

main() {
  var runes = new Runes('a');
  var resList = runes.toList(growable:false);
  Expect.throws(() {resList.length = 10;}, (e) => e is UnsupportedError);
  Expect.equals(1, resList.length);
}
