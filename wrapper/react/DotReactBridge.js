import React, {Component} from 'react';
import {Alert, NativeModules} from 'react-native';

(function(){ 	
	window.WISETRACKER_SDK_ENV_CODE = 3;
// 	NativeModules.DotReactBridge.initialization();
	window.DotReactBridge = NativeModules.DotReactBridge;
	window.DotReactBridge.initialization();
})();