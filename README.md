# ☕ RestauranteJAVA (Fictício)

![Java](https://img.shields.io/badge/Java-17+-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen.svg)
![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.x-green.svg)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3.3-purple.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)

Sistema completo de gerenciamento de restaurante desenvolvido com **Spring Boot** e **Thymeleaf**, oferecendo uma experiência moderna e intuitiva para cadastro de pratos, clientes, pedidos e contato.

## 📋 Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Funcionalidades](#funcionalidades)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração do Banco de Dados](#configuração-do-banco-de-dados)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Screenshots](#screenshots)
- [API Endpoints](#api-endpoints)
- [Contribuindo](#contribuindo)
- [Licença](#licença)
- [Contato](#contato)

## 🎯 Sobre o Projeto

**RestauranteJAVA** é uma aplicação web completa para gerenciamento de restaurantes, que combina a robustez do Spring Boot com um design moderno e responsivo. O sistema permite gerenciar cardápios, clientes, pedidos e mensagens de contato de forma integrada e eficiente.

### ✨ Destaques

- 🎨 Interface moderna com design system consistente
- 📱 Totalmente responsivo (mobile-first)
- ⚡ Performance otimizada
- 🔒 Validações de formulário
- 🗄️ Banco de dados relacional com MySQL
- 📊 Dashboard com estatísticas de pedidos

## 🚀 Funcionalidades

### 📖 Cardápio
- ✅ Cadastro de pratos com nome, composição e preço
- ✅ Listagem visual de todos os pratos
- ✅ Formatação automática de valores monetários
- ✅ Cards animados e responsivos

### 👥 Clientes
- ✅ Cadastro de clientes com nome, e-mail e telefone
- ✅ Validação de e-mails únicos
- ✅ Interface amigável para registro

### 🛒 Pedidos (Encomendas)
- ✅ Criação de pedidos vinculados a clientes e pratos
- ✅ Controle de quantidade
- ✅ Campo de observações personalizadas
- ✅ Sistema de status (Pendente, Em Preparo, Pronto, Entregue)
- ✅ Cálculo automático de valores totais
- ✅ Histórico completo de pedidos
- ✅ Dashboard com estatísticas

### 📧 Contato
- ✅ Formulário de contato completo
- ✅ Categorização por assunto
- ✅ Registro de mensagens no banco de dados
- ✅ Página de confirmação de envio

### 📄 Páginas Institucionais
- ✅ Página inicial (Home)
- ✅ Sobre nós
- ✅ Contato
- ✅ Páginas de sucesso personalizadas
- ✅ Página de erro customizada

## 🛠️ Tecnologias Utilizadas

### Backend
- **Java 17+**
- **Spring Boot 3.x**
  - Spring Web
  - Spring Data JPA
  - Spring DevTools
- **Thymeleaf** - Template Engine
- **MySQL 8.0+** - Banco de Dados
- **Maven** - Gerenciamento de dependências

### Frontend
- **HTML5**
- **CSS3** (Custom Variables)
- **Bootstrap 5.3.3**
- **Font Awesome 6.4.0**
- **JavaScript (Vanilla)**

### Ferramentas
- **phpMyAdmin** - Administração do banco
- **Git** - Controle de versão
- **IntelliJ IDEA / Eclipse** - IDE

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- ☕ **Java JDK 17+** - [Download](https://www.oracle.com/java/technologies/downloads/)
- 🗄️ **MySQL 8.0+** - [Download](https://dev.mysql.com/downloads/)
- 📦 **Maven 3.6+** - [Download](https://maven.apache.org/download.cgi)
- 🔧 **Git** - [Download](https://git-scm.com/)

## ⚙️ Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/restaurante-java.git
cd restaurante-java
```

### 2. Configure o arquivo `application.properties`

Navegue até `src/main/resources/application.properties` e configure:

```properties
# Configuração do Servidor
server.port=8080

# Configuração do Banco de Dados
spring.datasource.url=jdbc:mysql://localhost:3306/restaurantedb?useSSL=false&serverTimezone=UTC
spring.datasource.username=seu_usuario
spring.datasource.password=sua_senha
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
spring.jpa.properties.hibernate.format_sql=true

# Thymeleaf
spring.thymeleaf.cache=false
spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
```

### 3. Crie o banco de dados

Execute no MySQL:

```sql
CREATE DATABASE restaurantedb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
```

### 4. Importe os dados iniciais (opcional)

Importe o arquivo SQL fornecido no projeto:

```bash
mysql -u seu_usuario -p restaurantedb < database/restaurantedb.sql
```

### 5. Compile e execute o projeto

```bash
# Compilar o projeto
mvn clean install

# Executar a aplicação
mvn spring-boot:run
```

### 6. Acesse a aplicação

Abra seu navegador e acesse:

```
http://localhost:8080
```

## 🗄️ Configuração do Banco de Dados

### Estrutura das Tabelas

#### Tabela: `cardapios`
```sql
CREATE TABLE cardapios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  composicao TEXT NOT NULL,
  preco DECIMAL(10,2) NOT NULL
);
```

#### Tabela: `clientes`
```sql
CREATE TABLE clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(20)
);
```

#### Tabela: `encomendas`
```sql
CREATE TABLE encomendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  cardapio_id INT NOT NULL,
  quantidade INT NOT NULL DEFAULT 1,
  observacoes TEXT,
  status VARCHAR(50) NOT NULL DEFAULT 'Pendente',
  data_encomenda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE,
  FOREIGN KEY (cardapio_id) REFERENCES cardapios(id) ON DELETE CASCADE
);
```

#### Tabela: `contatos`
```sql
CREATE TABLE contatos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  phone VARCHAR(20),
  subject VARCHAR(150) NOT NULL,
  message TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Relacionamentos

- **encomendas** ↔ **clientes** (N:1)
- **encomendas** ↔ **cardapios** (N:1)
- Cascade DELETE habilitado

## 📁 Estrutura do Projeto

```
restaurante-java/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── restaurante/
│   │   │           ├── controller/
│   │   │           │   ├── HomeController.java
│   │   │           │   ├── CardapioController.java
│   │   │           │   ├── ClienteController.java
│   │   │           │   ├── EncomendaController.java
│   │   │           │   └── ContatoController.java
│   │   │           ├── model/
│   │   │           │   ├── Cardapio.java
│   │   │           │   ├── Cliente.java
│   │   │           │   ├── Encomenda.java
│   │   │           │   └── Contato.java
│   │   │           ├── repository/
│   │   │           │   ├── CardapioRepository.java
│   │   │           │   ├── ClienteRepository.java
│   │   │           │   ├── EncomendaRepository.java
│   │   │           │   └── ContatoRepository.java
│   │   │           ├── service/
│   │   │           │   ├── CardapioService.java
│   │   │           │   ├── ClienteService.java
│   │   │           │   ├── EncomendaService.java
│   │   │           │   └── ContatoService.java
│   │   │           └── RestauranteApplication.java
│   │   └── resources/
│   │       ├── static/
│   │       │   └── css/
│   │       │       └── style.css
│   │       ├── templates/
│   │       │   ├── index.html
│   │       │   ├── cadastrocardapio.html
│   │       │   ├── cardapio.html
│   │       │   ├── cliente.html
│   │       │   ├── encomenda.html
│   │       │   ├── listaencomendas.html
│   │       │   ├── sobre.html
│   │       │   ├── contato.html
│   │       │   ├── error.html
│   │       │   ├── sucessocardapio.html
│   │       │   ├── sucessoemailenviado.html
│   │       │   └── sucessoencomenda.html
│   │       └── application.properties
│   └── test/
├── database/
│   └── restaurantedb.sql
├── pom.xml
└── README.md
```

## 🖼️ Screenshots

### Página Inicial
![Home](screenshots/home.png)

### Cardápio
![Cardápio](screenshots/cardapio.png)

### Lista de Pedidos
![Pedidos](screenshots/pedidos.png)

### Formulário de Contato
![Contato](screenshots/contato.png)

## 🔗 API Endpoints

### Páginas Públicas
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/` | Página inicial |
| GET | `/cardapio` | Listar cardápio |
| GET | `/sobre` | Página sobre |
| GET | `/contato` | Formulário de contato |

### Cardápio
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/Cadastrocardapio` | Formulário de cadastro |
| POST | `/card` | Salvar prato |

### Clientes
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/cliente` | Formulário de cadastro |
| POST | `/client` | Salvar cliente |

### Pedidos
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/Encomenda` | Formulário de pedido |
| POST | `/enco` | Salvar pedido |
| GET | `/encomendas` | Listar pedidos |

### Contato
| Método | Rota | Descrição |
|--------|------|-----------|
| GET | `/contato` | Formulário |
| POST | `/contact` | Enviar mensagem |

## 🎨 Design System

### Paleta de Cores
```css
--java-orange: #ff6b35;      /* Cor principal */
--java-dark: #2c3e50;         /* Cor escura */
--java-light: #f8f9fa;        /* Cor clara */
--java-hover: #ff8555;        /* Hover */
```

### Componentes
- **Cards**: `.card-java`
- **Botões**: `.btn-java`, `.btn-outline-java`
- **Navbar**: `.navbar-java`
- **Footer**: `.footer-java`
- **Badges**: `.badge-price`
- **Animações**: `.fade-in-up`

## 🤝 Contribuindo

Contribuições são bem-vindas! Para contribuir:

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Diretrizes
- Siga as convenções de código Java
- Mantenha o padrão de design estabelecido
- Adicione testes quando aplicável
- Documente novas funcionalidades

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autores

- **Seu Nome** - [GitHub](https://github.com/seu-usuario)

## 📞 Contato

- **Email**: contato@restaurantejava.com.br
- **Telefone**: (11) 9999-9999
- **Instagram**: [@restaurantejava](https://instagram.com/restaurantejava)

## 🙏 Agradecimentos

- [Spring Boot](https://spring.io/projects/spring-boot)
- [Bootstrap](https://getbootstrap.com/)
- [Font Awesome](https://fontawesome.com/)
- [Thymeleaf](https://www.thymeleaf.org/)

---

⭐ Se este projeto foi útil para você, considere dar uma estrela!

**Desenvolvido com ☕ e 💻 por RestauranteJAVA Team**