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

### Installation

#### Option 1: Local Development
1. Clone the repository
2. Build and run:
   ```bash
   swift run
   ```

#### Option 2: Docker (Recommended)
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