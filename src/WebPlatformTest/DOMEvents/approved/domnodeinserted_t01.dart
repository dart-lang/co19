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