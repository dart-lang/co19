/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String origin
 * Returns the origin of the URI in the form scheme://host:port for
 * the schemes http and https.
 * It is an error if the scheme is not "http" or "https".
 * @description Checks expected origin values
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  var x = 'http://b:123';
  Expect.equals(x, Uri.parse(x).origin);
  
  x = 'https://[2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d]:1111';
  Expect.equals(x, Uri.parse(x).origin);
  
  Expect.throws(() => Uri.parse('asdf://host').origin); // not http or https
}
