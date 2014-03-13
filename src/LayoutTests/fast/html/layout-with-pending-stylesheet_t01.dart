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
  var body = document.body;

  body.setInnerHtml('''
    <div id="testDiv"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  // Create a pending stylesheet, this href intentionally 404s.
  var linkTag = document.createElement('link');
  linkTag.href = 'does-not-exist.css';
  linkTag.rel = 'stylesheet';
  document.head.append(linkTag);

  var textDiv = document.createElement('div');
  textDiv.setAttribute('id', 'text');
  textDiv.append(new Text('test'));
  document.getElementById('testDiv').append(textDiv);

  Expect.equals(document.getElementById("text").clientWidth,
      document.getElementById("text").clientWidth);
}
