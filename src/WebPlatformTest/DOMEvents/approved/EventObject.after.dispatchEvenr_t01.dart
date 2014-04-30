/*
 * after web-platform-tests/DOMEvents/tests/approved/domnodeinserted_t01.html
 *
 * @assertion 
 * @description As the final step of the event dispatch, the implementation must reset the event
 * object's default-action-prevention state.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const String htmlEL='<input id="target" type="hidden" value=""/>';
         
void main() {

    Element el = new Element.html(htmlEL);
    document.body.append(el);
    var EVENT = "foo";
    var TARGET = document.getElementById("target");
    var PreState;
    var PosState;

    Event evt = new Event(EVENT, canBubble:true, cancelable:true);
            
    void TestEvent(evt) {
        evt.preventDefault();
        PreState = evt.defaultPrevented;
    }

   TARGET.addEventListener(EVENT, TestEvent, true);
   TARGET.dispatchEvent(evt);
       
    PosState = evt.defaultPrevented;

    assert_array_equals([evt.target, PreState, PosState], [TARGET, true, false]);
}