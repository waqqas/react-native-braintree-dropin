
# react-native-braintree-dropin

## Getting started

`$ npm install react-native-braintree-dropin --save`

### Mostly automatic installation

`$ react-native link react-native-braintree-dropin`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-braintree-dropin` and add `RNBraintreeDropin.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBraintreeDropin.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.waqqasjabbar.braintree.RNBraintreeDropinPackage;` to the imports at the top of the file
  - Add `new RNBraintreeDropinPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-braintree-dropin'
  	project(':react-native-braintree-dropin').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-braintree-dropin/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-braintree-dropin')
  	```


## Usage
```javascript
import RNBraintreeDropin from 'react-native-braintree-dropin';

// TODO: What to do with the module?
RNBraintreeDropin;
```
  