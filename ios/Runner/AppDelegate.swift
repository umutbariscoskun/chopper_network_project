import UIKit
import Flutter
import SystemConfiguration

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let animeChannel = FlutterMethodChannel(name: "com.example.app/anime",
                                                binaryMessenger: controller.binaryMessenger)
        animeChannel.setMethodCallHandler({
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "checkDeviceInfos" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.handleCheckDeviceInfo(result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func handleCheckDeviceInfo(result: @escaping FlutterResult) {
        print("Handling checkDeviceInfos")
        
        let deviceInfo = getDeviceInfo()
        print("Device Info: \(deviceInfo)")
        
        let networkStatus = checkNetworkStatus()
        print("Network Status: \(networkStatus)")
        
        let resultMap: [String: Any] = [
            "deviceInfo": deviceInfo,
            "networkStatus": networkStatus
        ]
        
        print("Sending result to Flutter: \(resultMap)")
        result(resultMap)
        print("Result sent successfully")
    }
    
    private func getDeviceInfo() -> String {
        let device = UIDevice.current
        return "\(device.systemName) \(device.systemVersion), \(device.model)"
    }
    
    private func checkNetworkStatus() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret
    }
}