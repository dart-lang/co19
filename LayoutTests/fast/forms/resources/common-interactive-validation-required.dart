library common_interactive_validation_required;

import "dart:html";
import "../../../testcommon.dart";

//var queryValues = {};

testInteractiveValidationRequired(config) {
  //asyncStart();
  //description("Test interactive validation with required attribute. This test checks if an empty required field prevents form submission and checks if a non-empty required field doesn't prevent form submission.");

  var expectedValue = config['expectedValue'];

  /*var keyValuePairs = window.location.search.replace('?', '').split('&');
  for (var index = 0; index < keyValuePairs.length; ++index) {
    var keyValue = keyValuePairs[index].split('=');
    queryValues[keyValue[0]] = unescape(keyValue[1]);
  }*/

  var queryValues = Uri.parse(window.location.href).queryParameters;

  if (queryValues.containsKey('submitted')) {
    shouldBeEqualToString(queryValues["test"], expectedValue);
    //asyncEnd();
    return;
  }

  var form = document.createElement("form");
  form.setAttribute("action", window.location.href);
  form.setInnerHtml('<input type=hidden name=submitted value=1><input  id=submit type=submit><input id=test name=test type=' + config['inputType'] + ' required>',
      treeSanitizer: new NullTreeSanitizer());
  document.body.append(form);

  debug('Submit without required value');
  document.getElementById('submit').click();

  if (document.activeElement.id != 'test') {
    testFailed('Focus should be on test element.');
    //asyncEnd();
    return;
  }

  debug('Submit with required value');
  (document.getElementById('test') as InputElement).value = expectedValue;
  document.getElementById('submit').click();
  //testFailed('The form was not submitted.');
  //asyncEnd();
}
