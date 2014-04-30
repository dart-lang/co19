/*
 * after web-platform-tests/DOMEvents/tests/approved/stopImmediatePropagation.effect.html
 *
 * @assertion Event.stopImmediatePropagation()
 * stopImmediatePropagation() prevents other event listeners from being triggered and,
 * unlike Event.stopPropagation(), its effect must be immediate.
 * Once it has been called, further calls to this method have no additional effect.
 * @description
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
    var ExpectResult = [window, window, document, document, HTML, HTML, BODY, BODY, TABLE];
    var ActualResult = [];
    var ExpectListeners = [0,1,0,1,0,1,0,1,0];
    var ActualListeners = [];
         
    void TestEvent(evt, i) {
        ActualResult.add(evt.currentTarget);         
        ActualListeners.add(i);
        if ((1 == evt.eventPhase) && (TABLE == evt.currentTarget) && (0 == i)) {
            evt.stopImmediatePropagation();
        }
    }

    for (var i=0; i < CurrentTargets.length; i++) {
       CurrentTargets[i].addEventListener(EVENT, (e){TestEvent(e, 0);}, true);
       CurrentTargets[i].addEventListener(EVENT, (e){TestEvent(e, 1);}, true);
    }
       
    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
    TARGET.dispatchEvent(evt);

    assert_array_equals(ActualResult, ExpectResult, "ActualResult");
    assert_array_equals(ActualListeners, ExpectListeners, "ActualListeners");
}