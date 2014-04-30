/*
 * after web-platform-tests/DOMEvents/tests/approved/DOM.event.flow.html
 *
 * @assertion Event dispatch and DOM event flow
 * @description Dispatch an event in a DOM tree using the DOM event flow.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String htmlEL='''
<table id="table" border="1" style="display: none">
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
    var ExpectPhases = [1,1,1,1,1,1,1,2,2,3,3,3,3,3,3,3,];
    var ActualPhases = [];

    void TestEvent(evt) {
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