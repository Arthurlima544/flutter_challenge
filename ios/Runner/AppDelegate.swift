import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not a FlutterViewController")
    }

    let channel = FlutterMethodChannel(name: "samples.flutter.dev/info",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler({
      (call: FlutterMethodCall, result: FlutterResult) -> Void in
      
      if call.method == "getOSVersion" {
        result(UIDevice.current.systemVersion)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}