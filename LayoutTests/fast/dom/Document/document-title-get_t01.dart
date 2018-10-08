/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks the implementation of getting the 
 * document.title attribute.
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  //debug('Test with empty title');
  document.title = "";
  Expect.equals("", document.title);

  //debug('Test with only whitespace');
  document.title = "\t\n\r    \r     \t\n\n";
  Expect.equals("", document.title);

  //debug('Test with no whitespace');
  document.title = "nowhitespacetitle";
  Expect.equals("nowhitespacetitle", document.title);

  //debug('Test with whitespace');
  document.title = "\u0009\u000aone\u000b\u000cspace\u000d\u0020";
  Expect.equals("one space", document.title);

  //debug('Test with various whitespace lengths and fields');
  document.title = "   lots of \r whitespace and \n\n\n    \t    newlines \t";
  Expect.equals("lots of whitespace and newlines", document.title);
}
