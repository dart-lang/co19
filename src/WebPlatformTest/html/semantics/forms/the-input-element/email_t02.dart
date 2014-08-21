/**
 * after web-platform-tests/html/semantics/forms/the-input-element/email.html
 * @assertion
 * http://www.w3.org/TR/2012/CR-html5-20121217/forms.html#e-mail-state-(type=email)
 * @description Input Email
 * only tests using "element.values" 
 * don't know how to replace "element.values" 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
  <input type="email" id="single_email" value="user@example.com"/>
  <input type="email" id="multiple_email" value="user1@example.com, user2@test.com" multiple/>
''';

void main() {
  document.body.appendHtml(htmlEL);

  // Regexp from http://www.w3.org/html/wg/drafts/html/master/forms.html#e-mail-state-(type=email)
  RegExp validEmailRegexp = new RegExp(r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/");

  // When the mutiple attribute is specified on the element
  InputElement element = document.getElementById('multiple_email');
  print("element is ${element.runtimeType}");
  
  test((){
    var values = element.values;
    assert_equals(values.length, 2);
    assert_equals(values[0], 'user1@example.com');
    assert_equals(values[1], 'user2@test.com');
  }, 'The element\'s values are the result of splitting on commas the element\'s value.');
  
  test((){
    element.value = '';
    var values = element.values;
    values.add('user,@example.com');
    assert_equals(values.length, 0);
  }, 'User agents must not allow users to set any individual value to a string containing "," (U+002C) character');
  
  test((){
    element.value = '';
    var values = element.values;
    values.add('user@e\u000Axample.com');
    assert_equals(values.length, 0);
  }, 'User agents must not allow users to set any individual value to a string containing "LF" (U+000A) character');
  
  test((){
    element.value = '';
    var values = element.values;
    values.add('user@e\u000Dxample.com');
    assert_equals(values.length, 0);
  }, 'User agents must not allow users to set any individual value to a string containing "CR" (U+000D) character');

  // Whenever the user changes the element\'s values, the user agent must run the following steps
    element.value = '  user1@example.com  , user2@test.com, user3@test.com  ';
    test((){
      var values = element.values;
      assert_equals(values.length, 3);
    }, 'Let latest values be a copy of the element\'s values.');
    
    test((){
      var values = element.values;
      assert_equals(values[0], 'user1@example.com');
      assert_equals(values[1], 'user2@test.com');
      assert_equals(values[2], 'user3@test.com');
    }, 'Strip leading and trailing whitespace from each value in latest values');
    
  // When the multiple attribute is set, the user agent must run the value sanitization algorithm
    element.value = '  user1@example.com  , user2@test.com, user3@test.com  ';
    test((){
      var values = element.values;
      assert_equals(values[0], 'user1@example.com');
      assert_equals(values[1], 'user2@test.com');
      assert_equals(values[2], 'user3@test.com');
    }, 'Split on commas the element\'s value, strip leading and trailing whitespace from each resulting token, if any, and let the element\'s values be the (possibly empty) resulting list of (possibly empty) tokens, maintaining the original order.');

  checkTestFailures();
}
