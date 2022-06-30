#!make
.PHONY: clean format force_clean run_unit build_qa build_prod_apk build_prod run_dev_qa get

all: lint format run_dev_qa

## Roda o dart format no projeto
format:
	@echo "╠ Formatting the code"
	@cd ../dependencies && fvm dart format .
	@cd ../common && fvm dart format .
	@cd ../modules && fvm dart format .
	@cd ../twittergb && fvm dart format .

## Roda o flutter clean
clean:
	@echo "╠ Cleaning the project..."
	@cd ../dependencies && fvm flutter clean
	@cd ../common && fvm flutter clean
	@cd ../modules && fvm flutter clean
	@cd ../twittergb && fvm flutter clean

## Roda o flutter clean
get:
	@echo "╠ Running flutter pub get..."
	@cd ../dependencies && fvm flutter pub get
	@cd ../common && fvm flutter pub get
	@cd ../modules && fvm flutter pub get
	@cd ../twittergb && fvm flutter pub get

force_clean: clean
	@cd ../dependencies && rm pubspec.lock
	@cd ../common && rm pubspec.lock
	@cd ../modules && rm pubspec.lock
	@cd ../twittergb && rm pubspec.lock

## Roda os testes unitários
run_unit:
	@echo "╠ Running the tests"
	@fvm flutter test || (echo "▓▓ Error while running tests ▓▓"; exit 1)

## Roda o linter
lint:
	@echo "╠ Verifying code..."
	@cd ../dependencies && fvm dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)
	@cd ../common && fvm dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)
	@cd ../modules && fvm dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)
	@cd ../twittergb && fvm dart analyze . || (echo "▓▓ Lint error ▓▓"; exit 1)

## Roda o app em debug apontando para QA
run_dev_qa: lint format
	@echo "╠ Running the app"
	@fvm flutter run --dart-define=isQA=true

## Roda o app em debug apontando para produção
run_dev_prod: lint format
	@echo "╠ Running the app"
	@fvm flutter run --dart-define=isQA=false

## Roda o app em release mode apontando para homologação
run_release_qa: clean get lint format
	@echo "╠ Running the app"
	@fvm flutter run --release --dart-define=isQA=true

## Gera o appbundle do app aprontando para QA
build_qa: clean get lint format
	@echo "╠ Building the app"
	@fvm flutter build appbundle --dart-define=isQA=true

## Gera o appbundle do app aprontando para produção
build_prod: clean get lint format
	@echo "╠ Building the app"
	@fvm flutter build appbundle --dart-define=isQA=false

## Gera os APKs do app aprontando para QA
build_qa_apk: clean get lint format
	@echo "╠ Building the app"
	@fvm flutter build apk --split-per-abi --dart-define=isQA=true

## Gera os APKs do app aprontando para produção
build_prod_apk: clean run_unit lint format
	@echo "╠ Building the app"
	@fvm flutter build apk --split-per-abi --dart-define=isQA=false