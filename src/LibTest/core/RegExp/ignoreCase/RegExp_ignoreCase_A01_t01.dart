/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool ignoreCase
 * Whether this regular expression is case insensitive.   
 * @description Checks that this property holds the correct value.
 * @author rodionov
 */
 
main() {
  check("(ab|cd)+|ef", "AEKFCD", false, true);
  check(@"^[^\n\r]+$", "pilOt\nsoviet\trobot\r\nopenoffice", true, false);
  check(@"^(a+)\1*,\1+$", "aaaaaaaaa,aaaaaa\naa,aaaa\naaaaa,a", true, false);
  check(@"(ab|cd)+|ef", "AEKFCD", false, true);
}

void check(String pattern, String str, bool multiLine, bool ignoreCase) {
  RegExp re = new RegExp(pattern, multiLine, ignoreCase);
  Expect.equals(ignoreCase, re.ignoreCase);
}
