gen_env:
	dart pub get --directory=tools/gen_env
	dart run tools/gen_env/lib/main.dart

sync:
	fvm flutter clean
	fvm flutter pub get
	dart run intl_utils:generate
	fvm flutter pub run build_runner build --delete-conflicting-outputs
