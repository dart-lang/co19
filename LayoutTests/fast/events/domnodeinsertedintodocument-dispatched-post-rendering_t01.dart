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
  var f = new DocumentFragment.html('''
      <title>DOMNodeInsertedIntoDocument: dispatch after appending to the render tree</title>
      <style type="text/css">

        .appended {
          width: 100px;
        }

        .inserted {
          width: 200px;
        }

        .replaced {
          width: 300px;
        }

      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(f);

  var body = document.body;

  test (element, expected_width, methodName) {
    var width = getComputedStyle(element, null).width;
    debug('adding with method $methodName ()');
    shouldBe(width, expected_width);
  };

  var appended_element = document.createElement('div');
  appended_element.className = 'appended';
  appended_element.addEventListener('DOMNodeInsertedIntoDocument', (event) {
    test(appended_element, '100px', 'append');
  }, false);
  body.append(appended_element);

  var inserted_element = document.createElement('div');
  inserted_element.className = 'inserted';
  inserted_element.addEventListener('DOMNodeInsertedIntoDocument', (event) {
    test(inserted_element, '200px', 'insertBefore');
  }, false);
  body.insertBefore(inserted_element, appended_element);

  var replaced_element = document.createElement('div');
  replaced_element.className = 'replaced';
  replaced_element.addEventListener('DOMNodeInsertedIntoDocument', (event) {
    test(replaced_element, '300px', 'replaceWith');
  }, false);
  inserted_element.replaceWith(replaced_element);
}
