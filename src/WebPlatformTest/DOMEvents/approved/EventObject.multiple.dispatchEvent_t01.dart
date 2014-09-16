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
 * after web-platform-tests/DOMEvents/tests/approved/EventObject.multiple.dispatchEvent.html
 *
 * @assertion Multiple dispatchEvent() and stopPropagation()  
 * @description An event object may be properly dispatched multiple times while also allowing
 * to prevent the event objects propagation prior to the event dispatch.
 * @needsreview: file an issue: dispatchEvent does not clear Event.propagation_flag.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="parent">          
    <input id="target" type="hidden" value=""/>
</div>
''';
         
void main() {
    Element el = new Element.html(htmlEL);
    document.body.append(el);
    var EVENT = "foo";
    var TARGET = document.getElementById("target");
    var PARENT = document.getElementById("parent");
    var ExpectResult = [TARGET, PARENT, PARENT, document, window];
    var ActualResult = [];
    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
        
    void TestEvent(evt) {
        EventTarget currentTarget = evt.currentTarget;
print("  currentTarget=$currentTarget");      
        ActualResult.add(currentTarget);
        if (PARENT == evt.currentTarget)  {
            evt.stopPropagation();
print("    stopped");      
        }
    }

    TARGET.addEventListener(EVENT, TestEvent, false);
    PARENT.addEventListener(EVENT, TestEvent, false);
    document.addEventListener(EVENT, TestEvent, false);
    window.addEventListener(EVENT, TestEvent, false);
        
print("TARGET.dispatchEvent:");
    TARGET.dispatchEvent(evt);

print("PARENT.dispatchEvent:");  
//    evt = new Event(EVENT, canBubble:true, cancelable:true);
    PARENT.dispatchEvent(evt);

print("document.dispatchEvent:");  
//    evt = new Event(EVENT, canBubble:true, cancelable:true);
    document.dispatchEvent(evt);

    assert_array_equals(ActualResult, ExpectResult);
}

