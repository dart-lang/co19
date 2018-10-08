/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E single
 * Returns the single element in [this].
 * @description Checks that [last] is final and can't be set
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  dynamic runes = new Runes('a');
  Expect.throws(() {runes.single = 1;}, (e) => e is NoSuchMethodError);
}
