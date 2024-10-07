package com.example.verygoodcore.chopper_network

import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.content.Context

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.app/anime"
    private val TAG = "MainActivity"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        Log.d(TAG, "Configuring Flutter Engine")
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            Log.d(TAG, "Received method call: ${call.method}")
            when (call.method) {
                "checkDeviceInfos" -> handleCheckDeviceInfo(result)
                else -> {
                    Log.w(TAG, "Method not implemented: ${call.method}")
                    result.notImplemented()
                }
            }
        }
    }

    private fun handleCheckDeviceInfo(result: MethodChannel.Result) {
        Log.d(TAG, "Handling checkDeviceInfos")
        CoroutineScope(Dispatchers.Main).launch {
            try {
                val deviceInfo = withContext(Dispatchers.IO) {
                    getDeviceInfo()
                }
                Log.d(TAG, "Device Info: $deviceInfo")
                
                val networkStatus = withContext(Dispatchers.IO) {
                    checkNetworkStatus()
                }
                Log.d(TAG, "Network Status: $networkStatus")

                val resultMap = mapOf(
                    "deviceInfo" to deviceInfo,
                    "networkStatus" to networkStatus
                )
                
                Log.d(TAG, "Sending result to Flutter: $resultMap")
                result.success(resultMap)
                Log.d(TAG, "Result sent successfully")
            } catch (e: Exception) {
                Log.e(TAG, "Error in checkDeviceInfos", e)
                result.error("NATIVE_ERROR", "Native tarafında bir hata oluştu: ${e.message}", e.stackTraceToString())
            }
        }
    }

    private fun getDeviceInfo(): String {
        return "Android ${android.os.Build.VERSION.RELEASE}, ${android.os.Build.MODEL}"
    }

    private fun checkNetworkStatus(): Boolean {
        val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val network = connectivityManager.activeNetwork ?: return false
        val activeNetwork = connectivityManager.getNetworkCapabilities(network) ?: return false
        return when {
            activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> true
            activeNetwork.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> true
            else -> false
        }
    }
}