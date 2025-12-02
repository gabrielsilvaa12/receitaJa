# ReceitaJá 🍳

**ReceitaJá** é um aplicativo móvel desenvolvido em **Flutter** que permite aos usuários descobrir novas receitas culinárias, visualizar detalhes de preparo e gerenciar uma lista de favoritos personalizada. O projeto integra consumo de API externa, autenticação de usuários e armazenamento em nuvem.

## 📱 Sobre o Projeto

O objetivo do aplicativo é fornecer uma interface simples e intuitiva para amantes da culinária. O aplicativo consome dados da API pública **TheMealDB** para listar receitas variadas. Além disso, utiliza o ecossistema **Firebase** para gerenciar a identidade dos usuários e persistir seus dados (favoritos e perfil) na nuvem, garantindo que as informações estejam acessíveis em qualquer dispositivo.

## ✨ Funcionalidades

* **Autenticação de Usuário:**
    * Login e Cadastro de novos usuários (Email e Senha) via Firebase Auth.
    * Persistência de sessão (mantém o usuário logado).
* **Catálogo de Receitas:**
    * Listagem de receitas obtidas via API externa.
    * Visualização detalhada com foto, nome e modo de preparo.
* **Sistema de Favoritos:**
    * O usuário pode favoritar receitas.
    * Os favoritos são salvos no **Cloud Firestore** vinculados ao ID do usuário.
    * Remoção rápida de favoritos com feedback visual.
* **Perfil do Usuário:**
    * Exibição do nome e e-mail.
    * Alteração da foto de perfil (utilizando Câmera ou Galeria).
    * Logout.
* **Notificações:**
    * Notificações locais (`flutter_local_notifications`) disparadas ao adicionar uma receita aos favoritos.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** [Dart](https://dart.dev/)
* **Framework:** [Flutter](https://flutter.dev/)
* **Gerenciamento de Estado:** `ChangeNotifier` / `ListenableBuilder` (Nativo)
* **Backend & Serviços (Firebase):**
    * [Firebase Auth](https://firebase.google.com/docs/auth) (Autenticação)
    * [Cloud Firestore](https://firebase.google.com/docs/firestore) (Banco de Dados NoSQL)
    * [Firebase Storage](https://firebase.google.com/docs/storage) (Armazenamento de imagens)
* **Consumo de API:** [Dio](https://pub.dev/packages/dio)
* **Outros Pacotes Importantes:**
    * `image_picker`: Para selecionar fotos da galeria ou câmera.
    * `flutter_local_notifications`: Para feedback ao usuário via notificações.
    * `google_fonts`: Para tipografia personalizada.

## 🚀 Como Rodar o Projeto

### Pré-requisitos

* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
* Um emulador Android/iOS ou dispositivo físico conectado.
* Configuração do Firebase (o arquivo `google-services.json` já deve estar na pasta `android/app`).

### Passo a Passo

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/seu-usuario/receitaja.git](https://github.com/seu-usuario/receitaja.git)
    cd receitaja
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Configuração do Firebase:**
    * Certifique-se de que o arquivo `google-services.json` (para Android) e o `GoogleService-Info.plist` (para iOS, se aplicável) estejam nas pastas corretas.
    * *Nota:* O projeto atual já possui configurações para Android integradas no `build.gradle`.

4.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```

## 📂 Estrutura de Pastas

O código fonte principal está localizado em `lib/`:

* `lib/main.dart`: Ponto de entrada da aplicação e inicialização do Firebase.
* `lib/auth_gate.dart`: Controla o fluxo de navegação (Login vs Home) baseado no estado de autenticação.
* `lib/pages/`: Contém as telas do aplicativo (Login, Home, Detalhes, Favoritos, Perfil).
* `lib/services/`: Camada de serviços para lógica de negócios (Auth, Receitas API, Favoritos, Notificações).
* `lib/models/`: Modelos de dados (ex: Classe `Receita`).
* `lib/components/`: Widgets reutilizáveis (Header, Navbar).

## 🔌 API Externa

Este projeto utiliza a API pública do [TheMealDB](https://www.themealdb.com/api.php) para buscar os dados das receitas.
Endpoint utilizado: `https://www.themealdb.com/api/json/v1/1/search.php?s=`

## 📝 Licença

Este projeto foi desenvolvido para fins de estudo e aprendizado.

---
Feito com 🧡 e Flutter.
