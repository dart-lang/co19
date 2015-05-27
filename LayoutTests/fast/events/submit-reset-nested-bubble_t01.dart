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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      This tests that we stop propagation when bubbling a submit or reset event to more than one form.  This matches Firefox behavior<br>
      This can only occur when misnested tags cause forms to be nested.<br>
      <br>
      You can manually test the submit event, but this automated test will only test the reset event.
      <br><br>
      <form id="outer_form">
          <div id="div">
          <table>
          </form>
          </table>
              <form id="inner_form">
                  <input type=submit id="bt_submit" value="Submit"></input>
                  <input type=reset id="bt_reset" value="Reset"></input>
              </form>
          </div>
          <div id="res"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var msgs = [];

  log(msg) {
    msgs.add(msg);
  }

  phaseString(phase)
  {
    var str;
    if (phase == 1)
      str = "capture";
    else if (phase == 2)
      str = "target";
    else if (phase == 3)
      str = "bubble";
    return str;
  }
  window_listener(evt)
  {
    var str = phaseString(evt.eventPhase);
    log("window " + evt.type + " " + str);
  }

  reg_listener(evt) {
    var str = phaseString(evt.eventPhase);
    log(evt.currentTarget.id + " " + evt.type + " " + str);
    return false;
  }

  test()
  {
    window.addEventListener("submit", window_listener, true); 
    document.getElementById('outer_form').addEventListener("submit", reg_listener, true); 
    document.getElementById('inner_form').addEventListener("submit", reg_listener, true); 
    document.getElementById('div').addEventListener("submit", reg_listener, true); 

    window.addEventListener("submit", window_listener, false); 
    document.getElementById('outer_form').addEventListener("submit", reg_listener, false); 
    document.getElementById('inner_form').addEventListener("submit", reg_listener, false); 
    document.getElementById('div').addEventListener("submit", reg_listener, false);

    window.addEventListener("reset", window_listener, true); 
    document.getElementById('outer_form').addEventListener("reset", reg_listener, true); 
    document.getElementById('inner_form').addEventListener("reset", reg_listener, true); 
    document.getElementById('div').addEventListener("reset", reg_listener, true); 

    window.addEventListener("reset", window_listener, false); 
    document.getElementById('outer_form').addEventListener("reset", reg_listener, false); 
    document.getElementById('inner_form').addEventListener("reset", reg_listener, false); 
    document.getElementById('div').addEventListener("reset", reg_listener, false);

    document.getElementById('bt_reset').click();

    shouldBeList(msgs,
        ['window reset capture',
        'outer_form reset capture',
        'div reset capture',
        'inner_form reset target',
        'inner_form reset target',
        'div reset bubble']);
  }

  test();
}
