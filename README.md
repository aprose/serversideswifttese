# ServerSide Swift Vapor App

A modern web application built with Swift Vapor framework.

## Features

- **Swift Vapor 4**: Latest version of the Vapor web framework
- **SQLite Database**: Fluent ORM with SQLite driver
- **Leaf Templating**: Server-side rendering with Leaf templates
- **RESTful API**: Todo API with CRUD operations
- **Environment Configuration**: Flexible environment-based configuration
- **Testing Suite**: Unit tests with XCTVapor

## Project Structure

```
├── Package.swift                 # Swift Package Manager configuration
├── Sources/
│   └── App/
│       ├── main.swift           # Application entry point
│       ├── configure.swift      # App configuration
│       ├── routes.swift         # Route definitions
│       ├── Controllers/         # Route controllers
│       ├── Models/             # Data models
│       └── Migrations/         # Database migrations
├── Resources/
│   └── Views/                  # Leaf templates
├── Public/                     # Static assets
├── Tests/                      # Test suite
└── .env                       # Environment variables
```

## Getting Started

### Prerequisites

- Swift 5.9 or later
- Xcode (for macOS development)
- **OR** Docker & Docker Compose (for containerized deployment)
- **OR** GitHub Codespaces (for cloud development)

### Installation

#### Option 1: GitHub Codespaces (Recommended for Quick Start)
1. Click the "Code" button in your GitHub repository
2. Select "Codespaces" tab
3. Click "Create codespace on main"
4. Wait for the environment to set up automatically
5. The app will be built and ready to run!

#### Option 2: Local Development
1. Clone the repository
2. Build and run:
   ```bash
   swift run
   ```

#### Option 3: Docker (Containerized)
1. Clone the repository
2. Build and run with Docker Compose:
   ```bash
   docker-compose up --build
   ```

The SQLite database file will be created automatically when you first run the application and will persist in a Docker volume.

### API Endpoints

- `GET /` - Welcome page
- `GET /hello` - Hello world endpoint
- `GET /todos` - List all todos
- `POST /todos` - Create a new todo
- `DELETE /todos/:id` - Delete a todo

### Development

#### GitHub Codespaces
The easiest way to develop:
1. Open in GitHub Codespaces (everything is pre-configured)
2. Run the app:
   ```bash
   swift run
   ```
3. Visit the forwarded port 8080 in your browser

#### Local Development
Run in development mode:
```bash
swift run App serve --env development
```

#### Docker Development
Run with Docker Compose:
```bash
docker-compose up --build
```

To rebuild after code changes:
```bash
docker-compose down
docker-compose up --build
```

To view logs:
```bash
docker-compose logs -f vapor-app
```

Run tests:
```bash
swift test
```

## GitHub Codespaces

This project is fully configured for GitHub Codespaces with:

- **Pre-built environment**: Swift 5.9, SQLite, and all dependencies
- **VS Code extensions**: Swift language support, Docker tools, GitHub Copilot
- **Automatic setup**: Dependencies resolved and project built on startup  
- **Port forwarding**: Access your app directly from the browser
- **Development tools**: Git, Docker-in-Docker, and debugging support

### Codespace Features:
- ✅ **Zero setup time** - Everything configured automatically
- ✅ **Consistent environment** - Same setup for all developers
- ✅ **Cloud-based** - Develop from anywhere with just a browser
- ✅ **Pre-installed extensions** - Swift, Docker, Copilot ready to go
- ✅ **Automatic port forwarding** - Test your app instantly

### Quick Start in Codespaces:
```bash
# App is already built, just run:
swift run

# Access at the forwarded port 8080
# Visit /todos to see the todo list
```

## Configuration

Environment variables can be set in the `.env` file:

- `LOG_LEVEL` - Logging level (default: info)

The SQLite database is stored in `data/db.sqlite` (local) or in a Docker volume (containerized) and is automatically created when the app first runs.

## Docker Deployment

The application includes a complete Docker setup:

- **Multi-stage Dockerfile**: Optimized for production with minimal runtime image
- **Docker Compose**: Easy orchestration with persistent data storage
- **Health Checks**: Built-in health monitoring
- **Volume Persistence**: Database data survives container restarts

### Quick Start with Docker
```bash
# Build and run
docker-compose up --build

# Run in background
docker-compose up -d --build

# Stop and remove
docker-compose down

# View logs
docker-compose logs -f
```

## License

This project is open source and available under the MIT License.