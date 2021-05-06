// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion RuneIterator(String string)
 * Create an iterator positioned at the beginning of the string.
 * @description Checks BidirectionalIterator interface
 * @author sgrekhov@unipro.ru
 */
import "../BidirectionalIterator/allTests.lib.dart";

BidirectionalIterator create([Iterable? content]) {
  if (content == null) {
    return new RuneIterator("");
  } else {
    return new RuneIterator(new String.fromCharCodes(content as Iterable<int>));
  }
}

main() {
  test(create, isSet: false);
}
