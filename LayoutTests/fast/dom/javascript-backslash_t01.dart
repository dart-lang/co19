/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml(r'''
      <p>This tests \ characters being changed to / in all different scenarios.</p>
      <p>If it works you should see seven messages below that have \ or / characters as specified.</p>
      <hr>
      <a id="1" href="javascript:alert('to be\\not')">1</a>
      <a id="2" href="http://apple.com\support">2</a>
      <a id="3" href="https:\\login.apple.com\support/">3</a>
      <a id="4" href="file:///Users\">4</a>
      <a id="5" href="ftp://apple.com\support/">5</a>
      <a id="6" href="http://apple.com\support?path=\\myshare\myfolder\myfile\">6</a>
      <a id="7" href="http://apple.com\support#path=\\myshare\myfolder\myfile\">7</a>
      <hr>
      <p><ol id="console"></ol></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug(r"javascript: function argument containing a backslash (\) should not be converted to a slash (/)");
  shouldBe((document.getElementById("1") as AnchorElement).pathname,
      r"alert('to be\\not')");
  debug(r"http: base should convert a \ to a /");
  shouldBe((document.getElementById("2") as AnchorElement).href,
      "http://apple.com/support");
  debug(r"https: base should also convert a \ to a /");
  shouldBe((document.getElementById("3") as AnchorElement).href,
      "https://login.apple.com/support/");
  debug(r"file: base should convert a \ to a /");
  shouldBe((document.getElementById("4") as AnchorElement).href,
      "file:///Users/");
  debug(r"any other valid base except javascript: should convert a \ to a /");
  shouldBe((document.getElementById("5") as AnchorElement).href,
      "ftp://apple.com/support/");
  debug(r"query strings should be left alone:");
  shouldBe((document.getElementById("6") as AnchorElement).href,
      r"http://apple.com/support?path=\\myshare\myfolder\myfile\");
  debug("anchors should be left alone as well:");
  shouldBe((document.getElementById("7") as AnchorElement).href,
      r"http://apple.com/support#path=\\myshare\myfolder\myfile\");
}
