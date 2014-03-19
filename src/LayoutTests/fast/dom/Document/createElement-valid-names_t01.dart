/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test various valid name for elements according to the
 * definition of DOM Level 2.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var nameList = [
    // First Char ASCII in Unicode categories Ll, Lu
    'ascii',
    'Ascii',
    // First Char Latin1 in Unicode categories Ll, Lu
    'àscii',
    'Àscii',
    // First Char Unicode, above Latin1, in categories Ll, Lu, Lo, Lt
    'āscii',
    'Ăscii',
    'ƻscii',
    'אscii',
    'āscii',
    'āscii',
    // Exceptions for first Char: ':' and '_'
    ':ascii',
    '_ascii',
    // Other Char Latin1 in Unicode categories Ll, Lu
    'aàscii',
    'aÀscii',
    // Other Char Unicode, above Latin1, in categories Ll, Lu, Lo, Lt
    'aāscii',
    'aĂscii',
    'aƻscii',
    'aאscii',
    'aāscii',
    'aāscii',
    // Other Char Unicode in Mc, Me, Mn, Lm, or Nd
    'aa֑',
    'a⃣',
    'aि',
    'aʳ',
    'a0',
    // Exceptions for other Char: '-' and '.'
    'a---i',
    'a...i',
    ];

  for (var tag in nameList) {
    try {
      var element = document.createElement(tag);
      Expect.isNotNull(element);
    } catch (e) {
      Expect.fail('Error creating element for "$tag"');
    }
  }
}
