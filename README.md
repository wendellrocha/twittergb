## Setup
Para executar o projeto e/ou gerar builds é necessário instalar o [just](https://github.com/casey/just) ou o [make](https://community.chocolatey.org/packages/make)

Após instalar, entrar no diretório `twittergb`

```pwsh
just get ou make get # resolver as dependências
just run ou make run # rodar em desenvolvimento
just build_apk ou make build_apk # gerar apks
just build_bundle ou make build_bundle # gerar appbundle
```