/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test various invalid name for elements according to the 
 * definition of DOM Level 2.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var nameList = [
    // Invalid first Char
    '0ascii',
    '.Ascii',
    '-Ascii',
    ' ascii',
    '	ascii',
    '֑sc.ii',
    '⃣scii',
    'िascii',
    'ʳascii',
    // Invalid other char
    'asc i',
    'asc	i',
    'asciiⅦ'
  ];

  for (var i in nameList) {
    var tag = '" + nameList[i] +"';
    Expect.throws(() {
      document.createElement(tag);
    }, (e) => e is DomException && e.name == 'InvalidCharacterError',
    'The string "$tag" contains invalid characters.');
  }
}
