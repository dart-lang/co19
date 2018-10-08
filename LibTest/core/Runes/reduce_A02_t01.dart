/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E previousValue, E element))
 * If [this] is empty, a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown.
 * @note undocumented
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  var runes = new Runes('');
  Expect.throws(() {runes.reduce((prev, cur) => 0);}, (e) => e is StateError);
}
