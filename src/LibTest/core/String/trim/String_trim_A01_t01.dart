/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where leading and trailing whitespaces of this string 
 * have been removed, or returns this string if it does not have leading and trailing whitespaces.
 * @description Check that all kinds of whitespace characters are removed
 * @author msyabro
 */
 

main() {
  Expect.isTrue(" ".trim() == "");
  Expect.isTrue(" _ ".trim() == "_");
  Expect.isTrue(" _ _ ".trim() == "_ _");
  String str = """\u0009\u000a\u000d\u000b\u000c\u001c\u001d\u001e\u001f\u00a0\u2028\u2029\u205f\u3000
  \u0020\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b""";
  Expect.isTrue(str.trim() == "");
}
