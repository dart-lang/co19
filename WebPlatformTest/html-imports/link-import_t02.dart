/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html-imports/link-import.html
 * @assertion https://dvcs.w3.org/hg/webcomponents/raw-file/tip/spec/imports/index.html#loading-imports
 * @description Check on dynamically inserted element. The import should be loaded even for dynamically added links.  
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

const String resources = '${testSuiteRoot}/html-imports/resources';

void main() {
    
      var retries = 50;
      LinkElement linkToBeInserted = document.createElement("link") as LinkElement;
      linkToBeInserted.setAttribute("rel", "import");
      linkToBeInserted.setAttribute("href", "$resources/another.html");
      void checkAndDoneOncePassed() {
          var loaded = linkToBeInserted.import is DocumentFragment;
          if (loaded) {
            return;
          }
    
          retries--;
          if (retries <= 0) {
            Expect.fail("Too many retries.");
            return;
          }
    
          runLater(checkAndDoneOncePassed, 10);
      };
    
      checkAndDoneOncePassed();
}
