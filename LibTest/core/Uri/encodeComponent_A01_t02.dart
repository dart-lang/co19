/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String encodeComponent(String component)
 * Encode the string component using percent-encoding to make it safe for
 * literal use as a URI component.
 * All characters except uppercase and lowercase letters, digits and
 * the characters -_.!~*'() are percent-encoded.
 * @description Checks that unlisted characters from Unicode Basic
 * Multilingual Plane are percent-encoded.
 * @author ilya
 */
import "../../../Utils/expect.dart";

String canBeNotEncoded = "0123456789"
                         "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                         "abcdefghijklmnopqrstuvwxyz"
                         r"-_.!~*'()";

findUnescaped(String s) {
  var set = new Set();
  var skip = 0;
  for (var rune in s.runes) {
    if (skip > 0) {
      --skip;
    } else if (rune == '%'.codeUnitAt(0)) {
      skip = 2;
    } else {
      set.add(rune);
    }
  }
  return set;
}
    
tryRange(start, end) {
  var b = new StringBuffer('');
  for (var i=start; i<=end; ++i) {
    b.writeCharCode(i);
  }
  var s = b.toString();
  var unescapedSet = findUnescaped(Uri.encodeComponent(s));
  var diff = unescapedSet.difference(canBeNotEncoded.runes.toSet())
    .map((x)=>new String.fromCharCode(x)).toSet();
  Expect.isTrue(diff.isEmpty);
}

main() {
  tryRange(0, 0xD7FF);
  tryRange(0xE000, 0xFFFF);
}
