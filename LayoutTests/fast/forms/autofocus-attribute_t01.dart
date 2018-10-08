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
  document.body.setInnerHtml('''
      <p>This test checks for the autofocus attribute. Autofocus is set on the first
      and on the third input. Success on "YES NO YES".</p>
      <input autofocus id="one"/>
      <input/>
      <input autofocus/>
      ''', treeSanitizer: new NullTreeSanitizer());

  ElementList<Element> a = document.querySelectorAll("input");

  shouldBeTrue((a[0] as InputElement).autofocus);
  shouldBeFalse((a[1] as InputElement).autofocus);
  shouldBeTrue((a[2] as InputElement).autofocus);
}
