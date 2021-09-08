import React, {Component} from 'react';
import {Alert, NativeModules} from 'react-native';

(function(){ 	
	window.WISETRACKER_SDK_ENV_CODE = 3;
	window.DotReactBridge = NativeModules.DotReactBridge;
	//초기화 호출은 Native에서
	//window.DotReactBridge.initialization();
})();
