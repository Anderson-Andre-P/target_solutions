# Target Solutions App

Este é o aplicativo Target Solutions, desenvolvido usando Flutter e GetX.

## Funcionalidades

O aplicativo possui duas telas principais:

1. **LoginView:**

   - Tela de login com validações de entrada.
   - Campo de senha e campo de texto para o login.
   - Label de "Política de privacidade" que abre o navegador ao ser clicado.

2. **HomeView:**
   - Cada item na lista possui ícones de lápis para edição e X para exclusão.
   - Adição de novas frases através de um campo de texto.
   - Persistência de dados usando shared_preferences.
   - Utilização do MobX para gerenciamento de estado.

## Estrutura do Projeto

- **pubspec.yaml:** Arquivo de configuração do Flutter, listando as dependências do projeto.
- **lib/main.dart:** arquivo inicial da aplicação.
- **lib/app/components:** componentes e widgets reutilizáveis, como o custom_text_field.dart.
- **lib/app/modules:** páginas da aplicação.
- **lib/app/routes:** rotas da aplicação.

## Dependências

- get: ^4.1.4
- shared_preferences: ^2.0.13
- mobx: ^2.0.4
- flutter_mobx: ^2.0.3

## Como Executar

Certifique-se de ter o Flutter instalado na sua máquina.

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/target_solutions.git
```

2. Navegue até o diretório do projeto:

```bash
cd target_solutions
```

3. Execute o aplicativo:

```bash
flutter run
```

Isso iniciará o aplicativo no seu emulador ou dispositivo físico.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas ou enviar pull requests para melhorar o aplicativo.

## Licença

Este projeto é licenciado sob a MIT License - veja o arquivo [LICENSE](LICENSE) para detalhes.
