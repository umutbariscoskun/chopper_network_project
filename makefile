build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs


/// run in terminal for example: `make run-ios-debug-test`
run-debug-dev:
	flutter run --target lib/main.dart --flavor dev --dart-define=APP_ENV=dev

run-debug-uat:
	flutter run --target lib/main.dart --flavor uat --dart-define=APP_ENV=uat

run-debug-prod:
	flutter run --target lib/main.dart --flavor prod --dart-define=APP_ENV=prod

get:
	flutter pub get

clean:
	flutter clean
	$(MAKE) get

remove-lock-files:
	rm -rf pubspec.lock
	rm -rf ios/Podfile.lock	

deep-clean-arm:
	$(MAKE) remove-lock-files
	$(MAKE) clean
	cd ios && pod cache clean --all
	cd ios && arch -x86_64 pod install --repo-update