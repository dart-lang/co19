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
 * after web-platform-tests/DOMEvents/tests/approved/Propagation.path.target.moved.html
 *
 * @assertion  
 * @description Once determined, the event propagation path must not be changed,
 * even if an element in the propagation path is moved within the DOM.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String htmlEL='''
<table id="table" border="1">
    <tbody id="table-body">
    <tr id="table-row">
        <td id="table-cell">Shady Grove</td>
        <td>Aeolian</td>
    </tr>
    <tr id="parent">    
        <td id="target">Over the river, Charlie</td>
        <td>Dorian</td>
    </tr>
    </tbody>
</table>
''';

void main() {
    Element el = new Element.html(htmlEL);
    document.body.append(el);
    var EVENT = "foo";    
    var TARGET = document.getElementById("target");
    var PARENT = document.getElementById("parent"); 
    var TBODY = document.getElementById("table-body");
    var TABLE = document.getElementById("table");
    var BODY = document.body;
    var HTML = document.documentElement;                
    var CurrentTargets = [window, document, HTML, BODY, TABLE, TBODY, PARENT, TARGET];
    var ExpectResult = new List.from(CurrentTargets);
    ExpectResult.addAll([TARGET, PARENT, TBODY, TABLE, BODY, HTML, document, window]);
    var ActualResult = [];
    var ExpectPhases = [1,1,1,1,1,1,1,2,2,3,3,3,3,3,3,3];
    var ActualPhases = [];

    void TestEvent(evt) {   
        if (PARENT == TARGET.parentNode) {
            Element TableRow = document.getElementById("table-row");
            TARGET.remove();
            TableRow.append(TARGET);
        }
        ActualResult.add(evt.currentTarget);         
        ActualPhases.add(evt.eventPhase);                 
    }

    for (var i=0; i < CurrentTargets.length; i++) {
        CurrentTargets[i].addEventListener(EVENT, TestEvent, true);
        CurrentTargets[i].addEventListener(EVENT, TestEvent, false);
    }
       
    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
    TARGET.dispatchEvent(evt);

    assert_array_equals(ActualResult, ExpectResult, "ActualResult");
    assert_array_equals(ActualPhases, ExpectPhases, "ActualPhases");
}
