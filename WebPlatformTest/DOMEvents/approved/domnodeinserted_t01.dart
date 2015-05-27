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
/*
 * after web-platform-tests/DOMEvents/tests/approved/domnodeinserted_t01.html
 *
 * @assertion MutationEvent: DOMNodeInserted Event Type
 * @description DOMNodeInserted event fires when a node has been added as a child of another node.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String divStr='<div id="target"></div>';
         
void main() {
   Element div = new Element.html(divStr);
   document.body.append(div);
   var EVENT = "DOMNodeInserted";
   var TARGET;
   var NODE;

   TARGET = document.getElementById("target");

   TARGET.addEventListener(EVENT, (evt) {
       assert_equals(evt.type, EVENT);
       asyncEnd();
   }, true);
                    
   NODE = document.createElement("INPUT");
   asyncStart();
   TARGET.append(NODE);
}
