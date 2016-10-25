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
  dynamic style = new Element.html('''
      <style id="style">
          test { font-weight: bold !important; font-variant: small-caps !important; font-style: italic !important; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>
          Test for <i><a href="rdar://problem/6065547">rdar://problem/6065547</a>
          REGRESSION (r34879): "Subject" in unread emails in Yahoo mail is not shown in bold</i>.
      </p>
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var styleDeclaration = style.sheet.rules[0].style;

  test(propertyName) {
    debug(propertyName);
    shouldBe(styleDeclaration.getPropertyPriority(propertyName), 'important');
  }

  test('font-weight');
  test('font-variant');
  test('font-style');
}
