/**
 * after web-platform-tests/html/semantics/forms/the-input-element/time.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#the-input-element
 * @description Input Time
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
   <h1>Input Time</h1>
   <div style="display:none;">
      <input type="time "id="chkDefaultValue" />
      <input type="time" id="chkStep" />
      <input type="time" id="chkSetValueTest" />
      <input type="time" id="chkSupportAttribute" min="01:01:01.001" max="12:12:12.012" step="600" /> 
   </div>
''';

void main() {
  document.body.appendHtml(htmlEL);
		
/* check default value */
test((){ assert_equals(document.getElementById("chkDefaultValue").value, "");
}, "time element of default time value");
test((){assert_equals(document.getElementById('chkStep').step, "");
}	, "step attribute on default value check");
test((){assert_equals(document.getElementById('chkDefaultValue').max, "");
}	, "max  attribute on default value check");
test((){assert_equals(document.getElementById('chkDefaultValue').max, "");
}	, "min  attribute on default value check");

/* simple attribute test*/
test((){assert_equals(document.getElementById("chkSupportAttribute").type,"time");}
	, "type attribute support on input element");
test((){assert_equals(document.getElementById('chkSupportAttribute').min, "01:01:01.001");}
	, "max attribute support on input element");
test((){assert_equals(document.getElementById('chkSupportAttribute').max, "12:12:12.012");}
	, "min attribute support on input element");
test((){assert_equals(document.getElementById("chkSupportAttribute").step, "600");}
	, "step attribute support on input element");

/* check step up and down */
var _StepTest = document.getElementById("chkStep");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "";
	_StepTest.stepUp();
	assert_equals(_StepTest.value,"12:01");
} , "stepUp step value empty on default step value ");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "";
	_StepTest.stepDown();
	assert_equals(_StepTest.value,"11:59");
}, "stepDown step value empty default step value");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "-600";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "12:01");
},"stepUp on step value minus");
test((){
	_StepTest.value = "12:00";
	_StepTest.step = "-600";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "11:59");
},"stepDown on step value minus");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "0";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "12:01");
} , "stepUp on step value zero ");
test((){
	_StepTest.value = "12:00";
	_StepTest.step = "0";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "11:59");
} , "stepDown on step value zero ");

test((){
	_StepTest.value = "00:00";
	_StepTest.step = "86399";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "23:59:59");
} , "stepUp on step value 24 hour");
test((){
	_StepTest.value = "23:59:59";
	_StepTest.step = "86399";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "00:00:00");
} , "stepDown on step value 24 hour ");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "3600";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "13:00");
} , "stepUp on step value hour  ");
test((){
	_StepTest.value = "12:00";
	_StepTest.step = "3600";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "11:00");
} , "stepDown on step value hour ");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "1";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "12:00:01");
} , "stepUp on step value second ");
test((){
	_StepTest.value = "12:00";
	_StepTest.step = "1";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "11:59:59");
} , "stepDown on step value second ");

test((){
	_StepTest.value = "12:00";
	_StepTest.step = "0.001";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "12:00:00.001");
} , "stepUp on step value miri second ");
test((){
	_StepTest.value = "12:00";
	_StepTest.step = "0.001";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "11:59:59.999");
} , "stepDown on step value miri second ");

test((){
	_StepTest.value = "13:00:00";
	_StepTest.step = "1";
	_StepTest.stepUp(2);
	assert_equals(_StepTest.value, "13:00:02");
}, "stepUp argment 2 times");
test((){
	_StepTest.value = "13:00:00";
	_StepTest.step = "1";
	_StepTest.stepDown(2);
	assert_equals(_StepTest.value, "12:59:58");
}, "stepDown argment 2 times");

test((){
	_StepTest.max = "15:00";
	_StepTest.value = "15:00";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "15:00");
	_StepTest.max = "";
} , "stepUp stop because it exceeds the maximum value");
test((){
	_StepTest.min = "13:00";
	_StepTest.value = "13:00";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "13:00");
	_StepTest.min="";
} , "stepDown Stop so lower than the minimum value");

test((){
	_StepTest.max = "15:01";
	_StepTest.value = "15:00";
	_StepTest.step = "120";
	_StepTest.stepUp();
	assert_equals(_StepTest.value, "15:01");
	_StepTest.max = "";
} , "stop at border on stepUp");
test((){
	_StepTest.min = "12:59";
	_StepTest.value = "13:00";
	_StepTest.step = "120";
	_StepTest.stepDown();
	assert_equals(_StepTest.value, "12:59");
	_StepTest.min="";
} , "stop at border on stepDown");

test((){
	_StepTest.value = "";
	_StepTest.step = "60";
  _StepTest.stepUp();
	assert_equals(_StepTest.value, "00:01");
} , " empty value of stepUp");


/* set value test */
test((){
	var _time = document.getElementById("chkSetValueTest");
	_time.value = "12:00:00.000";
	assert_equals(_time.value, "12:00:00.000");
	_time.value = "hh:mi:ss.sss";
	assert_equals(_time.value, "");
}, "set value on not time format value");


  checkTestFailures();
}
