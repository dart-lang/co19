/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decodeQueryComponent(String encodedComponent,
 * {decode: null})
 * Decodes the percent-encoding in encodedComponent, converting pluses
 * to spaces
 * It will create a byte-list of the decoded characters, and then use [decode]
 * to decode the byte-list to a String. Default is a UTF-8 decoder.
 * @description Checks that decodeQueryComponent works with some arbitrary
 * defined decode functions
 * @author ilya
 * @reviewer
 */

import "../../../Utils/expect.dart";

// decoder takes only even bytes
even (list) {
  var i = 0;
  return new String.fromCharCodes(list.where((_) => (i++).isEven).toList());
}

// decoder takes only odd bytes
odd (list) {
  var i = 0;
  return new String.fromCharCodes(list.where((_) => (i++).isOdd).toList());
}
  
main() {
  var x = 'A-%42%43.~_+%42%43%42%43';
  Expect.equals('A-B.~_ BB', Uri.decodeQueryComponent(x, decode: even));
  Expect.equals('A-C.~_ CC', Uri.decodeQueryComponent(x, decode: odd));
}