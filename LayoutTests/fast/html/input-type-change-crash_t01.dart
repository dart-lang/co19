/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks that changing the 'type' attribute on an 
 * input element without a 'value' attribute doesn't crash.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  BodyElement body = document.body;

  body.setInnerHtml('''
    <input type="text"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  InputElement inputElement = document.getElementsByTagName("input")[0] as InputElement;

  Expect.equals('text', inputElement.type);
  inputElement.type = 'submit';
  Expect.equals('submit', inputElement.type);

  inputElement.remove();
}
